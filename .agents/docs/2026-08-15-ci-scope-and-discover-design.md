# CI 变更范围化 + discover 流水线修复设计方案

> 编写日期：2026-08-15
> 覆盖：`.github/workflows/ci.yml`（任务 1）、`.github/workflows/discover.yml` + `tools/discover.py`（任务 2）
> 一句话：**现在的 boot 门装了 PR 没改的包，却唯独不装 PR 改的那个包**；而 discover 三个 job 里有两个每天固定失败在同一行，根因是仓库设置 + 缺 token，不是脚本。

**实施状态**

| 期 | 内容 | 状态 |
|---|---|---|
| P0 | `DISCOVER_TOKEN` | ✅ 已配置并端到端验证（PAT 5000/h、开 PR、PR 触发 CI、contents:write） |
| P1 | `tools/affected.py` + boot matrix + `boot-gate` + surface 解析 | ✅ #12 已合并 |
| P2 | discover：checkout 接 token + 固定分支增量 + `--body-file` + concurrency | ⏳ |
| P3 | `gh_json` 区分 404 与错误 + rate_limit 预检 | ⏳ |
| P4 | 清理孤儿分支；分支保护改挂 `boot-gate` | ⏳ |

---

## 0. 一句话结论

| # | 问题 | 根因（已验证） | 结论 |
|---|---|---|---|
| 1 | 每个 PR 全量重装 | boot job 无条件 `xlings install` 两个 composite（7 个成员包），与 diff 无关 | 加 `scope` job 从 diff 算**受影响闭包**，boot 变 matrix；文档改动直接跳过 |
| 1b | **更严重的反面** | 新增插件的 PR **从来不 boot 那个新插件** | 范围化顺带把这个洞补上 —— 这才是主要收益 |
| 2 | discover 每天失败 | `GitHub Actions is not permitted to create or approve pull requests` | **需要你配一个 token**，见 §6.1 |
| 2b | 即使把设置打开也没用 | GITHUB_TOKEN 创建/推送的 PR **不触发任何 workflow**（已验证：3 个 bot 分支 0 次 CI） | 所以 token 不是"优化"，是**必需**：否则最该被 CI 拦的 PR 恰好是唯一没 CI 的 |
| 2c | 潜伏的错误告警 | `gh_json()` 把 404 / 403 限流 / 5xx / 网络错误**全部**返回 `None`，`--audit` 把 `None` 当作"pin 消失了" | 限流会伪装成"上游 force push 了" —— 本文件里最高危的一处 |

---

## 1. 现状实测（2026-08-14 ~ 08-15）

### 1.1 CI 四个 job 的真实耗时

取 main 上最近一次成功运行 `31842507289`：

| job | 耗时 | 与 diff 的关系 | 检查的是什么 |
|---|---|---|---|
| `descriptor contract` | **13s** | 无关，全量 | 全局不变量（成员 pin 对账、tier 覆盖、生成物一致） |
| `index-build sandbox` | **16s** | 无关，全量 | 70 个描述符在 libxpkg 纯 Lua 沙箱里能不能建出索引 |
| `site builds` | **30s** | 无关，全量 | 每个描述符产出一个页面 |
| `composites boot` | **3m43s** | **无关，全量** | 安装 xlings + 装两个 composite + 真启动 |
| **合计（墙钟）** | **3m46s** | | |

**boot 一个 job 占了 98% 的时间**，且它做的事与 PR 改了什么毫无关系。

### 1.2 boot job 现在到底装了什么

```bash
for a in $(grep -l 'kind = "profile"' pkgs/*/*.lua ...); do
  xlings install "dsh:$a" -y
  python3 tools/bootcheck.py --composite "$a"
done
```

`kind = "profile"` 的描述符只有两个，展开后是这些字节：

| composite | 成员 |
|---|---|
| `agent-web-coding` | dsh-at-file@0.1.0、dsh-annotation@1.3.13、dsh-notification@0.1.1、dsh-task-status@0.3.0 |
| `agent-tui-coding` | dsh-cc-tui@0.3.3、dsh-notification@0.1.1 |

即：**70 个描述符里，每个 PR 固定安装并启动其中 5 个不重复的插件，其余 65 个从不 boot。**

### 1.3 所以真正的问题不是"太慢"

一个新增 `dsh-foo` 的 PR，今天的 CI 会：

- ✅ 静态校验 `dsh-foo` 的描述符（13s，有效）
- ✅ 确认 `dsh-foo` 不会炸掉索引构建（16s，有效）
- ✅ 确认 `dsh-foo` 有页面（30s，有效）
- ❌ 花 3m43s 安装并启动 **和 dsh-foo 无关的 7 个包**
- ❌ **从头到尾没有装过一次 `dsh-foo`**

discover 每天自动开的 PR 全是这一类。所以范围化的收益不是省 3 分钟，而是**把 boot 预算从"总是花在同两个 composite 上"挪到"花在这次真正变动的包上"**。

---

## 2. 任务 1：变更范围化设计

### 2.1 设计原则：只范围化"按包分片"的检查

| job | 是否范围化 | 理由 |
|---|---|---|
| `descriptor contract` | ❌ 保持全量 | 13s；且它验的是**跨包的全局不变量**（`test_member_pins_match_the_member_descriptor` 要读所有 composite、`test_every_tier_is_represented` 要数所有 tier）。按包分片会把这些检查变成空操作 |
| `index-build sandbox` | ❌ 保持全量 | 16s；索引是一个整体产物，一个描述符能不能建成索引这个问题只有全量才有意义 |
| `site builds` | ❌ 保持全量 | 30s；它的断言就是"描述符数 == 页面数" |
| `composites boot` | ✅ **范围化 + matrix** | 3m43s，且天然按"可启动单元"分片 |

**把"只测变动的包"无脑套到全部四个 job 上会开洞。** 前三个加起来 59s，省下来的时间买不回丢掉的全局不变量。这一条要写死在方案里，避免以后有人顺手扩大范围。

### 2.2 受影响闭包（affected closure）

新增 `tools/affected.py`，输入 base..head 的变更文件列表，输出要 boot 的单元。

**路径分类：**

| 变更路径 | 结论 |
|---|---|
| `pkgs/<字母>/<name>.lua` | 受影响包 `<name>` |
| `template.lua`、`pkgindex-build.lua` | **全量** —— 模板给每个描述符追加生命周期 hook，改它等于改了所有包 |
| `tools/**`、`tests/**` | **全量** —— 生成器/校验器变了，全部重验 |
| `.github/workflows/ci.yml`、`.xpkgindex/**` | **全量** |
| `site/**`、`docs/**`、`.agents/**`、`*.md`、`LICENSE` | **空集** —— boot 整个跳过 |
| 其它未知路径 | **全量**（fail-open：不认识的东西一律当全量，宁可慢不可漏） |

**闭包传播（两个方向，都必须走）：**

```
改了 plugin P
  → boot P 自己                                     ← 今天缺失的那一半
  → boot 每一个 members 里点名了 P 的 composite       ← 反向依赖
改了 composite C
  → boot C 自己（它的成员会作为安装的一部分被装上）
```

反向依赖不能省：composite 的 `members` 里 pin 了成员的 version + commit，改成员描述符可能让 composite 的 pin 失效。静态测试 `test_member_pins_match_the_member_descriptor` 能抓到对账不一致，但**只有 boot 能证明那组字节还能一起跑起来**。

举例：

| PR 改了 | boot matrix |
|---|---|
| `pkgs/d/dsh-mnemon.lua`（新插件） | `dsh-mnemon` |
| `pkgs/d/dsh-notification.lua` | `dsh-notification`、`agent-web-coding`、`agent-tui-coding` |
| `pkgs/a/agent-tui-coding.lua` | `agent-tui-coding` |
| `README.md` | ∅（boot 跳过） |
| `template.lua` | 全量（3 个单元并行） |

### 2.3 workflow 结构

```yaml
jobs:
  scope:
    outputs:
      units: ${{ steps.calc.outputs.units }}   # JSON: [{"name":"x","kind":"plugin"}]
      any:   ${{ steps.calc.outputs.any }}
    steps:
      - uses: actions/checkout@v4
        with: { fetch-depth: 0 }        # 必须：默认 depth=1 没有 merge base
      - id: calc
        run: python3 tools/affected.py --base "$BASE" --head "$HEAD" --github-output

  boot:
    needs: scope
    if: needs.scope.outputs.any == 'true'
    strategy:
      fail-fast: false                  # 一个包坏了不能掩盖其它包
      max-parallel: 4
      matrix:
        unit: ${{ fromJSON(needs.scope.outputs.units) }}
    timeout-minutes: 15
    steps: ...  # 装 xlings → xlings update → 装并 boot 这一个单元

  boot-gate:
    needs: [scope, boot]
    if: always()
    # 全部 matrix leg 成功或被跳过 → 成功。分支保护挂在这个 job 上。
```

**`boot-gate` 是必需的**，不是装饰：分支保护的 required check 认的是 job 名，而 matrix job 的名字随 matrix 内容变化，且 `if` 跳过的 job 报的是 `skipped` 而不是 `success`。没有聚合 job，文档 PR 会永远卡在"等待 boot"。

**base ref 怎么取：**

| 事件 | base |
|---|---|
| `pull_request` | `${{ github.event.pull_request.base.sha }}`，用三点 `base...HEAD`（比 merge base，不比 main 的 tip） |
| `push` | `${{ github.event.before }}`；首次推分支时该值全 0 → 退化为全量 |
| `workflow_dispatch` / `schedule` | 全量 |

**全量兜底（不能省）：**

- push 到 `main` → 永远全量。合并后主干必须有一次完整证据。
- 每日 `schedule` → 全量。范围化只从 PR 路径里去掉冗余，**不能从仓库里去掉覆盖**。
- PR 打 `ci:full` 标签 → 全量。人工逃生口。

### 2.4 单个插件怎么 boot（这里有个真问题）

`bootcheck.py` 的非 composite 分支现在是：

```python
jobs.append((n, [(n, v)], ""))   # surface 传空
```

surface 空 → 只有 `@deepseek-ai/dsh-base` 一层。但描述符里 **64/70 个插件写着 `profile = "web"`**，它们是往 web 界面上叠的能力；裸 base 里启动它们，等于问一个这个索引从没承诺过答案的问题（`bootcheck.py` 的 docstring 自己就写了这一点，只是当时说的是 composite 成员）。

**方案：按描述符自己声明的 `dsh.profile` 解析 surface。**

| `dsh.profile` | surface bundle | 来源 |
|---|---|---|
| `web` | `@deepseek-ai/dsh-web-app` | 随 dsh 本体发布，无需安装 |
| `tui` / `cc-tui` | `dsh-cc-tui` | 索引内的包，需先 `xlings install dsh:dsh-cc-tui` |
| 其它/缺失 | 无 | 裸 base 启动，结果记为 `ENVIRONMENT: 未验证`，**不算通过** |

最后一行沿用 `bootcheck.py` 已有的"响亮跳过"机制（`::warning::<name> was NOT verified`）—— 一个没验成的包必须看起来像没验成，不能长得像通过。

`tui` 那一档还有个更省的做法：**不单独 boot，直接把它并进 `agent-tui-coding` 那一 leg**（它本来就要装 dsh-cc-tui）。P1 先按上表实现，P2 再考虑合并。

### 2.5 未镜像的包

67/70 已镜像。discover 新开的 PR 里，描述符**一定是未镜像状态**（fail-closed，`mirror` 块由 `tools/mirror.py` 事后写）。这类包 `xlings install` 走 pinned commit 从 GitHub 抓，**这正是真实用户会遇到的路径**，所以照装不误 —— 只是要注意：

- 13/70 个包 `needs_build = true`，装它们会跑 `prepare` 脚本 → 需要 pnpm，耗时更长。给 boot job 加 `timeout-minutes: 15`。
- GitHub 抓取失败要能区分"网络问题"和"包坏了"，沿用 `ENVIRONMENT:` 前缀的判据。

### 2.6 缓存

**只缓存 tarball store，不缓存工具链。**

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.xlings/data/xpkgs
    key: xpkgs-${{ hashFiles('pkgs/**/*.lua') }}
    restore-keys: xpkgs-
```

不缓存 `~/.xlings` 整体：那里面是 `curl | bash` 装出来的包管理器本体，缓存它等于把一次远程安装的结果无限期钉住，出问题时的排查成本远大于省下的 40 秒。tarball store 是内容寻址的，缓存它没有这个风险。

### 2.7 预期效果

| PR 类型 | 现在 | 之后 | 覆盖变化 |
|---|---|---|---|
| 纯文档 | 3m46s | **~35s** | 无损（本来就没测到东西） |
| 新增 1 个插件 | 3m46s，**不测新插件** | ~2m，**测新插件** | **净增** |
| 改 `dsh-notification` | 3m46s | ~3m（3 leg 并行） | 净增（多了插件自身） |
| 改 `template.lua` | 3m46s | ~2.5m（3 leg 并行） | 持平 |

### 2.8 被否掉的方案

| 方案 | 为什么不用 |
|---|---|
| `on.push.paths` / `paths-ignore` | 跳过的 job 报 `skipped` 不是 `success`，直接打死分支保护；且**无法表达反向依赖**（改成员要连带 boot composite） |
| `dorny/paths-filter` 之类第三方 action | 闭包逻辑无论如何都要读描述符里的 `members`，YAML DSL 表达不了；60 行 Python 能被 pytest 测、能本地跑 |
| 只 boot 变动的包，不管 composite | composite pin 了成员的 version+commit，改成员可能让组合失效 |
| 把静态检查也按包分片 | 见 §2.1，会把跨包不变量变成空操作 |

### 2.9 `tools/affected.py` 自己也要被测

加进 `tests/test_descriptors.py`（`static` 标记）：

- 改一个 composite 成员 → 输出必须包含那个 composite
- 改 `template.lua` → 必须返回全量
- 改未知路径 → 必须返回全量（fail-open）
- 删除的描述符路径 → 不能崩

否则这个"决定要不要测"的脚本自己就是没测过的代码。

---

## 3. 任务 2：discover CI 修复

### 3.1 现在到底怎么失败的（已从日志确认）

两次运行，同一处：

```
run 31774114300 (schedule, 08-14 05:47)  job "new plugins"  → 失败
run 31763876842 (dispatch, 08-14 02:29)  job "version updates" → 失败
```

失败行一字不差：

```
pull request create failed: GraphQL: GitHub Actions is not permitted to
create or approve pull requests (createPullRequest)
```

`audit` job 是成功的（它不开 PR）。

仓库 API 确认：

```console
$ gh api repos/Sunrisepeak/dsh-index/actions/permissions/workflow
{"default_workflow_permissions":"read","can_approve_pull_request_reviews":false}

$ gh secret list
（空 —— DISCOVER_TOKEN 未配置）
```

所以 `GH_TOKEN: ${{ secrets.DISCOVER_TOKEN || secrets.GITHUB_TOKEN }}` 落到了 GITHUB_TOKEN 分支，而仓库禁止 Actions 创建 PR。

> `default_workflow_permissions: read` 不影响 push —— workflow 里显式写了 `permissions: contents: write`，显式声明覆盖默认值，日志里 `git push` 也确实成功了。

### 3.2 把设置打开还不够（这条是关键）

推上去的分支还在：

```console
$ git ls-remote --heads origin | grep chore
2058d4d  refs/heads/chore/bump-20260814
d8782b4  refs/heads/chore/bump-20260814-v2
bd30ec4  refs/heads/chore/discover-20260814
```

而 `gh run list --workflow=ci.yml` 里，**这三个分支一次 CI 都没跑过**。`ci.yml` 明明写着 `on: push: branches: ['**']`。

原因是 GitHub 的固定规则：**GITHUB_TOKEN 触发的 push / PR 事件不会启动任何 workflow**（防递归）。

于是即使把 "Allow GitHub Actions to create and approve pull requests" 打开：

```
discover 开出 PR → PR 里全是没人看过的新包 → CI 不跑 → 人肉 review 就是唯一的门
```

**这个索引全部的价值就是那道门。让唯一没有 CI 的 PR 恰好是自动生成的那批，是不可接受的。**

→ **所以必须配 token。** 见 §6.1。

### 3.3 分支不幂等（第二个必踩的坑）

```bash
BR="chore/discover-$(date +%Y%m%d)"
git checkout -b "$BR"
git push -q -u origin "$BR"
```

- PR 开失败但分支已推 → 孤儿分支留下（现在已经攒了 3 个）
- 同一天重跑 → 远端分支已存在且历史不同 → **push 直接 non-fast-forward 被拒**，失败点从"开 PR"前移到"推分支"，错误信息完全对不上真实原因（`-v2` 那个分支就是这么手工绕出来的）

#### 为什么日期分支必然堆积（不只是孤儿分支的问题）

`discover.py` 的 `carried()` 是**读工作区的 `pkgs/`** 来判断"已经收录了什么"。而日期分支每天从 main 切出 —— 只要昨天的 PR 还没合并，main 里就没有昨天发现的包，于是：

```
Day 1: 从 main 切 → 发现 A B C → PR #20
Day 2: 从 main 切 → main 仍无 A B C → 发现 A B C D → PR #21   ← 完全包含 #20
Day 3: 从 main 切 → 发现 A B C D E → PR #22                  ← 完全包含 #21
```

**每个 PR 都是前一个的超集。** 一周不合并就是 7 个互相覆盖的 PR，同一批包被 review 7 次。这比孤儿分支严重得多，而且是设计使然，不是 bug。

#### 三个选项

| | 分支策略 | 一个 mode 同时开着几个 PR | 已有 review 评论 | 内容 |
|---|---|---|---|---|
| **A** | 日期分支（现状） | N 个，逐日超集 | 保留（但在废弃的 PR 上） | 重复 review |
| **B** | 固定分支 + 每日 force-push | 1 个 | **失效**（force-push 后 GitHub 标为 outdated） | 每天被重写 |
| **C** | 固定分支 + **增量追加** | 1 个 | **保留** | 只追加新发现 |

**推荐 C。** 关键改动只有一行：**checkout 那个固定分支，而不是 main**。

```bash
BR="chore/discover"
git fetch origin "$BR" && git checkout "$BR" || git checkout -b "$BR" origin/main
# ← discover.py 的 carried() 现在读到的是分支状态，昨天加过的 A B C 不会被重复发现
python3 tools/discover.py --new --json /tmp/new.json
python3 tools/sync.py --new /tmp/new.json
git diff --quiet && { echo "nothing new"; exit 0; }   # 没增量就什么都不做
git commit -F /tmp/msg.txt
git push -u origin "$BR"                              # 普通 push，不需要 force
PR=$(gh pr list --head "$BR" --state open --json number --jq '.[0].number')
[ -n "$PR" ] && gh pr edit "$PR" --body-file /tmp/body.md \
             || gh pr create --base main --head "$BR" --body-file /tmp/body.md
```

C 同时拿到三个性质：

- **一个 mode 只有一个开着的 PR**，内容是"当前待收录全集"（B 的好处）
- **只追加、不重写** → 昨天的 review 评论仍然锚在原来的行上（B 拿不到）
- **没有增量的那天什么都不做** → PR 不会因为空跑而 churn

C 的代价：分支会逐渐落后于 main。处理方式是**合并后删分支**，下次运行从 main 重新切出来；期间若产生冲突，workflow 报出来交人处理（不自动 rebase —— 自动 rebase 会把"只追加"这个性质毁掉）。

> 我最初写的是 B。想清楚 `carried()` 读的是工作区之后，C 严格优于 B：同样只有一个 PR，但不牺牲 review 评论。

### 3.4 `gh_json()` 分不清"没有"和"没问到"（最高危）

```python
def gh_json(path: str):
    r = subprocess.run(["gh", "api", path], capture_output=True, text=True)
    if r.returncode != 0:
        return None          # ← 404？403 限流？5xx？网络断了？全都是 None
```

用在 audit 里：

```python
if gh_json(f"repos/{cur['repo']}/commits/{cur['commit']}") is None:
    gone.append(...)          # ← 把"没问到"当成了"pin 消失了"
```

而 audit 的语义在 workflow 注释里写得很重：

> A pin that vanished means a force push, a rewritten history or a deleted repo […] The run fails and a human decides.

**一次限流会伪装成 67 个包的上游全部 force push 了。** 这是本文件里最高危的一处 —— 它不是"少发现一个包"，而是"发出一个假的、语义极重的警报"，并且发生在无人值守的定时任务里。

**修法：**

```python
def gh_json(path, *, allow_404=False):
    r = subprocess.run(["gh", "api", path, "-i"], capture_output=True, text=True)
    status = _status_line(r.stdout)          # 从 -i 的响应头拿真实状态码
    if status == 404:
        return None if allow_404 else _raise_gone(path)
    if status is None or status >= 400:
        raise GhError(f"{path}: HTTP {status}")   # 限流/网络 → 明确失败，不是"消失"
    return json.loads(_body(r.stdout))
```

- `mode_audit` 传 `allow_404=True`，**只有真 404 才算 gone**
- 其它任何错误 → 抛出 → job 失败，但摘要写的是"**无法验证**"而不是"**pin 消失**"
- `mode_new` / `mode_bump` 里的 `None` 同理：跳过一个仓库和"这个仓库没有 package.json"是两回事，前者要记进日志

### 3.5 速率预算

| token | REST 上限 | search 上限 |
|---|---|---|
| GITHUB_TOKEN | **1,000 req/小时/仓库** | 30 req/分钟 |
| PAT / App token | **5,000 req/小时** | 30 req/分钟 |

按当前 70 个描述符估算单次 `mode=all`：

| mode | 调用量 |
|---|---|
| `--new` | 2 个 topic × 最多 3 页 search + 每个候选仓库 2 次（commits + contents）。topic `dsh-plugin` 有约 281 个仓库 → **最多 ~560** |
| `--bump` | 67 × commits + 最多 67 × contents = **~134** |
| `--audit` | **67** |
| 合计 | **~760**，而且随索引线性增长 |

1,000 的天花板已经在同一个数量级了，且三个 job 并行跑在同一小时里。**配合 §3.4 的 bug，预算耗尽今天表现为"没发现新包"+"pin 全没了"** —— 两个都是静默的错误结论。

修法：PAT 把天花板抬 5 倍，另外加一次 `rate_limit` 预检，剩余额度不足时**明确失败**（而不是继续跑然后得出错误结论）。

### 3.6 其余问题

| # | 位置 | 问题 | 修法 |
|---|---|---|---|
| a | `gh pr create --body "…$(cat /tmp/new.log)…"` | 上游可控文本（仓库名、描述）插进双引号 shell 串。含反引号或 `$(…)` 的仓库描述会被**执行** | 写文件后 `--body-file` |
| b | 无 `concurrency:` | schedule 与 dispatch 同时跑会抢同一批分支 | `concurrency: { group: discover-${{ github.workflow }}, cancel-in-progress: false }` |
| c | `git add pkgs/ tools/profiles.json 2>/dev/null \|\| true` | 掩盖真实的 stage 失败 | 去掉掩码，文件不存在单独判 |
| d | `python3 tools/check_npm.py \|\| true` | 静默吞错 | 失败要进 `$GITHUB_STEP_SUMMARY` |
| e | commit message 里 `$(cat /tmp/*.log)` 带 YAML 缩进 | 提交信息正文每行前面挂着空格 | 用 `-F` 从文件读 |
| f | audit 的 `if: failure()` 里 `cat /tmp/gone.json` | 若 audit 因网络失败，该文件不存在 → 二次失败掩盖一次失败 | `[ -f /tmp/gone.json ] &&` 守卫 |

### 3.7 孤儿分支怎么处理

现存 3 个（`chore/bump-20260814`、`chore/bump-20260814-v2`、`chore/discover-20260814`）。

建议：**先按 §3.3 改成固定分支名，再让下一次 discover 跑一遍**，用新分支开出 PR 走正常 review；旧的三个直接删。不建议直接从旧分支开 PR —— 它们是在有 bug 的流程里生成的，内容需要重新跑一遍才可信。

---

## 4. 两个任务的交叉点

修完之后（token 配好 → discover PR 能触发 CI），**任务 1 的范围化恰好是 discover PR 最需要的东西**：

```
discover 每天开一个 PR，新增 N 个插件
  → scope 算出 N 个 unit
  → boot matrix 逐个真启动这 N 个新包
  → reviewer 看到的不是"CI 绿了"，而是"这 N 个包逐个启动成功"
```

这才是这个索引应该有的门。没有任务 1，discover 的 PR 即使跑了 CI 也只是又装了一遍那两个 composite。

---

## 5. 分期

| 期 | 内容 | 阻塞 |
|---|---|---|
| **P0** | 配 `DISCOVER_TOKEN`（§6.1） | **需要你操作** |
| **P1** | `tools/affected.py` + `scope`/`boot` matrix/`boot-gate` + `bootcheck.py` surface 解析 + affected 的单测 | 无 |
| **P2** | discover：固定分支 + PR upsert + `--body-file` + concurrency + 去掉错误掩码 | 无 |
| **P3** | `gh_json` 区分 404/错误 + rate_limit 预检 | 无 |
| **P4** | 清理 3 个孤儿分支；分支保护改挂 `boot-gate` | P1、P2 |

P1/P2/P3 各自独立成 PR（仓库 `pr-workflow` skill 的要求：一个 PR 一件事）。

---

## 6. 需要你做的事

### 6.1 配置 `DISCOVER_TOKEN`（必需）

两个选项，推荐 A：

**A. Fine-grained PAT（推荐，最省事）**

1. https://github.com/settings/personal-access-tokens/new
2. Repository access → Only select repositories → `Sunrisepeak/dsh-index`
3. Permissions：
   - `Contents` → **Read and write**（推分支）
   - `Pull requests` → **Read and write**（开/改 PR）
   - `Metadata` → Read（自动带上）
4. Expiration：建议 1 年（到期需要轮换 —— 这是 A 方案唯一的缺点）
5. 存进仓库 secret：
   ```console
   gh secret set DISCOVER_TOKEN --repo Sunrisepeak/dsh-index
   ```

**B. GitHub App（不会过期，但要多几步）**

建一个只装在本仓库的 App，给同样两个权限，workflow 里用 `actions/create-github-app-token` 换 installation token。适合长期无人值守，代价是初次配置麻烦。

> 注意：**光把 Settings → Actions → General → "Allow GitHub Actions to create and approve pull requests" 打开是不够的**（§3.2）—— 那样 PR 能开出来，但永远不触发 CI。要么配 token，要么接受 bot PR 没有 CI。两个都做也可以（token 是主路径，设置是兜底）。

配好之后 workflow 还要改一处，否则 push 仍然不触发 CI：

```yaml
- uses: actions/checkout@v4
  with:
    token: ${{ secrets.DISCOVER_TOKEN }}   # ← 让 push 也归属于 PAT
```

### 6.2 分支策略：已按 §3.3 的选项 C 定稿

不再需要在"每日重写"和"PR 堆积"之间二选一 —— 固定分支 + 增量追加两个都避开了。详见 §3.3。

唯一需要你确认的是**合并后的处理**：PR 合并后删掉 `chore/discover` / `chore/bump` 分支，下次运行从 main 重新切。（不删的话分支会一直落后于 main，早晚冲突。）

---

## 7. 未决

- `bootcheck.py` 单插件 boot 里 `tui` 档要不要单独装 `dsh-cc-tui`，还是并进 `agent-tui-coding` 那一 leg（§2.4 末）
- discover 的 `--new` 每天扫 281 个仓库的 package.json，是否值得引入 ETag / 上次扫描位置缓存（现在每天全量重扫）
- `mode_new` 里 `MIN_STARS = 2` 与 mirror 流水线的 5 星门槛不一致，是否需要对齐（不属于本次范围，记一笔）
