# dsh-index 设计方案 v2：把 Agent 作为分发单位

> 编写日期：2026-08-14
> 取代：`2026-08-13-dsh-plugin-index-design.md` 的分层部分（C/A 混合分发架构保留）
> 一句话：**harness + 一组插件 = 一个可运行的 Agent**，索引分发的是 Agent，不是散装插件。

---

## 0. 为什么要重构

v1 把索引定位成"插件的包索引"，168 个插件各是一个包。实践下来这个定位有两个问题。

**第一，在包管理这件事上 xlings 加不了东西。** `dsh plugin` 是 pnpm 的透传器：依赖解析、版本、lockfile、内容寻址 store 全是 pnpm 的。v1 的 `install()` 要么空转要么搬一个 tarball，`config()` 只是去调 `dsh plugin add`。实测 pnpm 的 store 让换版本零下载（切回旧版本 `downloaded 0, reused 2`），我们再包一层版本管理毫无意义。

**第二，单个插件很少是目的。** 65/68 的插件 README 让读者装进 `web`，因为它们是往上叠的能力，一个个装没有意义 —— 用户想要的是"一套能用的配置"。

而 v1 花了最多力气的地方（插件装进哪个 profile、surface 怎么分类、冲突怎么表达）**全是在给原子层安排组合层的职责**，做了三轮才退回来。

---

## 1. 重新定位：分发 Agent

```
dsh（harness 框架）  +  一组插件（能力）  =  一个可运行的 Agent
                                              ↑
                                        这才是用户要的东西
```

在 dsh 的模型里，这个"可运行的东西"已经有名字了 —— **profile**。它是 `$DSH_HOME/profiles/<name>`，一个有序的 bundle 组合，`dsh --profile <name>` 启动它。

所以索引不需要发明概念，只需要**把 profile 变成可分发的包**。

### 索引真正的价值只剩两条

| 价值 | 为什么 npm / pnpm / dsh 给不了 |
|---|---|
| **CN 镜像加速与可复现** | pnpm 只会去 registry.npmjs.org 或 github.com。实测 88% 的插件不在 npm 上（按 star 前 40 抽样：5 在、35 不在），裸名安装直接 404 |
| **组合作为分发单位** | `dsh plugin add` 一次一个，**没有任何方式分享"我这套配置"**。插件作者只能自己发 `.cmd` 脚本绕 |

其余的（依赖解析、版本切换、隔离）pnpm 和 dsh 自己做得更好，索引不该碰。

---

## 2. 三层模型

| 层 | 是什么 | payload | deps | 职责 |
|---|---|---|---|---|
| **plugin** | 原子能力 | 镜像 tarball + sha256 | 无 | **只负责获取和校验字节** |
| **group** | 可复用插件组 | 空 | 一组 plugin | 声明"这几个互不冲突"，可被多个 Agent 复用 |
| **profile** | **一个完整的 Agent** | 空 | 一组 plugin / group | 建 profile，把各 dep 装进去，可直接启动 |

### 2.1 职责切分是这次重构的核心

```
plugin  层 → xlings 擅长的：下载、sha256 校验、双镜像、pin commit
profile 层 → dsh   擅长的：把 bundle 组合成一个可启动的东西
```

**plugin 不再产生 profile 副作用。** v1 里每个插件安装时都要决定"装进哪个 profile"，这个问题反复了三轮 —— 根因就是原子层承担了组合层的职责。切开之后，这个问题从根上消失。

### 2.2 组合用 `deps`，不发明字段

xpkg 的 `deps` 已经有完整的解析、闭包安装和版本约束。索引里已有先例（`claude-llm`、`mcpp-short-cmd`、`sing-box-helper` 都是空 payload + `deps` 拉一组）。

```lua
-- profile：一个完整 Agent
package = {
    name = "coding-agent",
    description = "A coding Agent: TUI surface, file reference, notifications",
    dsh = {
        kind = "profile",
        profile = "coding",          -- 建这个 profile
    },
}
-- deps 由 template 展开到每个平台
-- deps = { "dsh:group-editing", "dsh:dsh-cc-tui" }
```

组合的读取用 `pkginfo.deps_list()` + `pkginfo.dep_install_dir(name)` —— 两个都是现成 API，profile 包据此拿到每个成员的 tarball 路径，逐个 `dsh plugin --profile <name> add <tarball>`。

### 2.3 `kind` 放 `dsh.*`，不占 `type`

xpkg 的 `type` 是**封闭枚举**，libxpkg 的 `parse_type()` 对未知字符串静默返回 `Package`：

```cpp
if (s == "script")   return PackageType::Script;
if (s == "template") return PackageType::Template;
if (s == "config")   return PackageType::Config;
if (s == "subos")    return PackageType::Subos;
return PackageType::Package;      // ← "dsh-plugin" 会落到这里，字符串丢失
```

写 `type = "dsh-plugin"` 不报错也不生效，索引产物里存的是 `0`。这是"声明了、蒸发了"的形态，与本索引一贯的 fail-closed 原则相悖。所以 `kind` 放在 `dsh.kind`，`type` 取 5 个合法值里语义最近的 `config`。

### 2.4 Agent 包是清单，不是 payload —— 以及为什么它非存在不可

profile 目录里被"创作"的部分只有清单。实测：把 `tui` profile 的 `package.json`（**222 字节**）单独拷到空目录跑 `pnpm install`，`resolved 92, reused 92, downloaded 0`，还原出完整的 36M `node_modules`。代码从来不"在" profile 里，它是被解析出来的。

所以 Agent 包本体也是几百字节的清单，没有 payload。它的成员 spec 可以**混用**，同一个 Agent 里三种并存不影响用户：

```json
"dependencies": {
  "dsh-cc-tui":  "0.1.8",                                   // npm
  "dsh-at-file": "github:omdsh-dev/dsh-at-file#<40 hex>",   // git pin
  "dsh-ads":     "file:/…/xpkgs/dsh-x-dsh-ads/…/dsh-ads-0.1.0.tgz"  // 本仓镜像
}
```

这正好承接 §5 的 C/A 混合：可镜像的成员指向本地 tarball（可复现 + CN 加速），不可镜像的指向 pin 死的 commit。

**那能不能干脆只分发一个 yml？** 不能。`--patch` 与 `cordis.patch.yml` 只有配置行、**没有依赖声明**，而 dsh 的 boot 路径不碰包管理器（`pnpm` 只出现在 `dsh plugin` 子命令里）。实测 patch 引用一个 npm 上确实存在（`dsh-tui@0.2.0`）但未安装的 bundle：

```
Error: dsh: plugin tree failed to load: failed to apply loader entry include
```

profile 的 `package.json` 未被写入任何内容 —— 它不尝试安装，找不到就崩。

**这是 Agent 包存在的根据**：dsh 差的正是"把清单变成已装好的树"这一步，而 `deps` 闭包安装是 xpkg 的本职。反过来，`--patch` 在本模型里的位置是**用户侧临时覆盖** —— 装完一个 Agent 后想临时改一行不必动 profile。这个能力写进 Agent 包文档，索引不接管。

---

## 3. 冲突：发布前的门，不是安装时的告警

两个 bundle patch 同一个 row id 时不会合并 —— patch 替换整行 config，后装的静默覆盖前者。**冲突单位是 row，不是 package**，所以 xpkg 即使有 `conflicts` 字段也套不上（而它没有：规范、150+ 配方、xlings 源码里都没有）。

实测全生态的冲突面很小：

```
覆盖 base 行的插件      5 / 68
真正两两相撞的组合      2 对
  system-prompt   dsh-cc-tui × dsh-tui
  tool-subagent   dsh-cc-tui × dsh-plugin-yet-another-subagent
```

在 v1 里这只能做成"安装时告警用户"。在三层模型里它变成**group / profile 发布前的 CI 门**：

> 一个 group 或 profile，若其成员集合中有两个覆盖同一个 base row，**构造上就是坏的，CI 直接拒绝合入**。

这是位置正确的检查 —— 组合的作者在发布前就该知道这组不能共存，而不是让每个用户装完自己发现界面错乱。

数据来源是 `tools/mine_overrides.py`：读每个 bundle 自己的 `cordis.patch.yml`，与 `@deepseek-ai/dsh-base` 的 78 个 row id 求交集。不是人工标注。

---

## 4. 与上游语义对齐

这一节是 v1 交学费最多的地方，规则写死。

**profile 名属于用户。** 上游文档说得很明确：`dsh plugin --profile <name>` 创建你传的任何名字，官方文档用 `demo`，`dsh-cc-tui` 的 README 用 `cc-tui` —— 都只是例子。索引替用户起名，会让上游所有文档的例子在索引下失效（实测把用户绊了两次）。

在三层模型里这条自然满足：**profile 名由 profile 包声明**，因为那个包就是那个 Agent，名字是它的一部分，不是索引推导的。

**dsh 没有任何环境变量能选 profile。** 全树只读 `DSH_HOME`、`DSH_WEB_URL`、`DSH_TELEMETRY_DISABLED`。选 profile 的唯一入口是 `--profile` 参数。所以：

- 索引不能提供"进某个环境自动用某个 profile"，除非上游加 `DSH_PROFILE`（值得提 issue）
- 索引自己用的安装期变量必须叫 `XIM_DSH_PROFILE`，不能叫 `DSH_PROFILE` 冒充上游变量

**环境隔离走 `DSH_HOME`。** 这是唯一能表达"一个 subos 一套插件世界"的机制，而且 dsh 真的读它。`xim:dsh` 用 `subos.env` 声明：

```lua
subos.env{ var = "DSH_HOME", op = "set", value = "${subosdir}/.dsh", binding = tag }
```

代价近乎为零 —— pnpm 内容寻址 store 让多个 home 共享同一份字节（实测 profile 的 node_modules 文件 `hardlink=16`）。

---

## 5. 分发架构（沿用 v1，无变化）

plugin 层的 C/A 混合保留，判据仍是许可证：

| | 走 C（镜像） | 走 A（直连） |
|---|---|---|
| 判据 | 许可证允许再分发 | 无 / 不可识别（标 `unknown`） |
| 今日规模 | 127 可镜像，41 已发布 | 42 |
| CN 加速 | ✅ 双镜像 + sha256 三方校验 | ❌ 结构上不可能 |

**group / profile 层没有 payload，因此没有镜像问题** —— 它们的可复现性完全来自成员 plugin 的 pin。

---

## 6. 站点

三层分栏，**Agent 在前**：

```
Agents      完整可用，装完即可启动          ← 首页主体
Groups      可复用插件组                    ← 给想自己拼的人
Plugins     原子能力                        ← 索引底座，默认折叠
```

每个 Agent 页展示：它包含哪些插件、启动命令、是否全部已镜像（决定能否离线/CN 安装）、成员是否有行冲突。

---

## 7. 取舍与代价

**单装一个 plugin 之后它不进任何 profile。** 原子层不碰 profile 是这次重构的核心，代价是"我只想加一个小插件"的人要多一步。缓解：原子包安装完打印现成命令（payload 里的 tarball 路径已知），复制即可。

**组合包的维护成本高于原子包。** 成员任一发新版，组合要重新验证"还能共存"。这比跟 68 个独立版本更麻烦，但验的是"这套真的能用"——而这正是索引的价值所在。

**索引会落后。** 实测 `dsh-cc-tui` 我们 pin `0.1.6`，npm 已到 `0.2.0`。可复现和最新是一对矛盾，索引选可复现，靠自动跟版本流水线（`discover.py` / `sync.py`，未做）缩短滞后。

---

## 8. 分期

1. **收尾 v1 已验证的四项**：profile 语义对齐、per-subos `DSH_HOME`、`XIM_DSH_PROFILE` 改名、pnpm arm64 + 最新版本
2. **加 `dsh.kind`**：68 个现存包标为 `plugin`，原子层去掉 profile 副作用
3. **首个 group + 首个 Agent**：跑通 `deps` 组合与发布前冲突门
4. **站点三层分栏**
5. **自动跟版本**：`discover.py` / `sync.py`

---

## 9. 未决

1. **group 与 profile 的卸载语义。** 卸载一个 Agent 要不要删掉它建的 profile？profile 里可能有用户手动加的东西 —— 倾向只移除自己带进去的成员，profile 目录保留。需实测 `dsh plugin remove` 的行为边界。
2. **成员版本冲突。** 两个 group 依赖同一个 plugin 的不同版本时，xpkg 的 deps 解析会怎么处理，需实测。
3. **Agent 的验收标准。** 「能启动」用 `--dump-config` 可验；「真的可用」需要 API key，CI 里不具备。可能只能验到组合层。
