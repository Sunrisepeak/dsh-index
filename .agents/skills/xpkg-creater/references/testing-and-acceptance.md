# testing & acceptance（dsh-index 版）

新增/修改插件描述符时，做四类验证：

1. **构建沙箱回归门**（本仓库特有，最容易被跳过、后果最严重）
2. **直接命令验证**（本地 xlings/xim + dsh）
3. **测试集验证**（pytest / CI 对齐）
4. **隔离环境真装真卸**

---

## A. 构建沙箱回归门（**先跑这个**）

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .
```

它复刻 libxpkg 的最小 plain-Lua 沙箱（xlings ≥ 0.4.52 就是在那里跑
`pkgindex-build.lua` 的），并断言 `template.lua` 真的被追加到了每个描述符尾部。

**为什么必须先跑**：这个沙箱里 `cprintf` / `try-catch` / `raise` / `os.getwinsize`
全是 nil。踩到任何一个，`install()` 就死，错误被调用方吞掉，
**构建出来的索引会静默丢掉全部 xpm 段**——包看起来还在，装的时候全挂。
它不会在任何其他测试里暴露。

跑完记得复原：harness 会把模板追加进 `pkgs/**`，别把追加后的文件提交进去。

```bash
git status --short pkgs/ && git checkout -- pkgs/
```

---

## B. 直接命令验证（本地）

假设插件描述符是 `pkgs/d/dsh-tool-csv.lua`，插件名 `dsh-tool-csv`。

```bash
# 1) 注册到本地索引
xim --add-xpkg $PWD/pkgs/d/dsh-tool-csv.lua
```

```bash
# 2) 搜索可见性
xim -s dsh-tool-csv
```

```bash
# 3) 安装（profile 显式指定，别依赖缺省值做验证）
DSH_PROFILE=verify xlings install local:dsh-tool-csv -y
```

```bash
# 4) 验证 bundle 真的进了 profile 清单
jq '.dependencies, .dsh.profile.bundles' ~/.dsh/profiles/verify/package.json
```

```bash
# 5) 验证配置层真的被组合进去了 —— 这是唯一的功能性证据
dsh --profile verify --dump-config | grep "== @deepseek-ai/dsh-tool-csv"
```

```bash
# 6) 卸载
xlings remove local:dsh-tool-csv -y
```

```bash
# 7) 卸载后复检：依赖和层必须同时消失
jq '.dependencies, .dsh.profile.bundles' ~/.dsh/profiles/verify/package.json
```

验收重点：

- 能搜索到
- 装完 profile 清单里**同时**有 `dependencies` 条目和 `dsh.profile.bundles` 条目
- `--dump-config` 里出现 `# == <bundle_name>` 的层
- 卸载后两者都消失
- **`$DSH_HOME` 下的其他 profile 没被动过**

---

## C. 隔离环境真装真卸（提 PR 前必须做一次）

不要用开发者真实环境验证，`$DSH_HOME` 和 `$XLINGS_HOME` 都要隔离：

```bash
TMP_XLINGS="$(mktemp -d)"
TMP_DSH="$(mktemp -d)"

XLINGS_HOME="$TMP_XLINGS" xlings update
XLINGS_HOME="$TMP_XLINGS" xlings config --add-xpkg "$PWD/pkgs/d/dsh-tool-csv.lua"

XLINGS_HOME="$TMP_XLINGS" DSH_HOME="$TMP_DSH" DSH_PROFILE=verify \
  xlings install local:dsh-tool-csv -y

# 产物断言：不要看安装命令的退出码，去 ls / jq 真实文件
jq . "$TMP_DSH/profiles/verify/package.json"

XLINGS_HOME="$TMP_XLINGS" DSH_HOME="$TMP_DSH" DSH_PROFILE=verify \
  xlings remove local:dsh-tool-csv -y

jq . "$TMP_DSH/profiles/verify/package.json"

rm -rf "$TMP_XLINGS" "$TMP_DSH"
```

**测之前先清可能存在的同名同版本安装**——xlings 在同名同版本已装在另一个 namespace
下时会整个跳过 install hook 并照样打印成功：

```bash
rm -rf ~/.xlings/data/xpkgs/{dsh,local}-x-dsh-tool-csv/<version>
```

### C1. `needs_build = true` 的包

必须验证**两条路径**：

```bash
# 未授权：必须失败，并打印为什么需要授权
DSH_ALLOW_BUILDS= xlings install local:<pkg> -y      # 期望：失败

# 已授权：允许安装
DSH_ALLOW_BUILDS=1 xlings install local:<pkg> -y     # 期望：成功
```

"未授权也装上了"是安全缺陷，不是便利。

---

## D. 测试集验证（pytest / CI 对齐）

### D1. 新增包必须新增/覆盖测试

- 描述符 schema 检查由 `tests/test_descriptors.py` 全量覆盖，
  新增包**通常不需要新测试文件**——这是模板化索引相对 xim-pkgindex 的差别。
- 只有当这个包引入了新的 `dsh.*` 字段形状（例如非默认 `patch` 路径）时，
  才需要补一条针对性用例。

### D2. 分层执行

```bash
# 必跑：描述符静态检查（schema / sha 格式 / latest 自洽）
pytest tests/ -m static -q
```

```bash
# 必跑：隔离合规
pytest tests/ -m isolation -q
```

```bash
# 必跑：索引注册
pytest tests/ -m index -q
```

```bash
# 抽样：生命周期 + 功能（全量跑不动，169 个包 × 每次 pnpm 安装）
pytest tests/ -m "lifecycle or verify" -q
```

L3/L4 的抽样规则写死在 workflow 里，并且**必须 log 出没跑的部分**——
静默截断会被读成"全覆盖了"。

---

## E. PR 中必须写的测试信息

1. 构建沙箱回归门结果（`lua5.4 tests/libxpkg_sandbox_harness.lua .`）
2. 直接命令验证：装 → `--dump-config` 看到层 → 卸 → 清单干净
3. 隔离环境真装真卸的实际输出（不是"应该可以"）
4. `needs_build = true` 时，未授权路径确实失败的证据
5. pytest 命令与结果（至少 static / isolation / index）
6. 未跑项及其原因与风险
