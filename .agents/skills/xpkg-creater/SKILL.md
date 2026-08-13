---
name: xpkg-creater
description: 在 dsh-index 中创建/维护 dsh 插件的 xpkg 描述符。本仓库的包只写数据、不写 hook——生命周期由 template.lua 在索引构建期统一追加。覆盖 XPackage 规范、hook runtime 陷阱、subos 隔离约束、构建沙箱回归门与验收流程。
---

# xpkg-creater（dsh-index 版）

> 本 skill 由 `openxlings/xim-pkgindex` 的同名 skill 改编。
> **改编要点**：本仓库是**模板化索引**——`pkgs/**/*.lua` 只有 `package = {...}` 数据，
> `type` / `xpm` / 四个 hook 全部来自 `template.lua`，由 `pkgindex-build.lua` 在索引构建期追加。
> 所以"写一个包"在这里 = **写一份描述符**，而不是写一份 hook。
> 上游仓库里关于 XLINGS_RES 镜像发布、共享名 flavor（glibc/musl/JDK）的章节
> 与本仓库无关，已删除；换成了构建沙箱和 dsh 侧的约束。

命名空间固定为 **`dsh`**：

```bash
xim --add-indexrepo dsh:https://github.com/Sunrisepeak/dsh-index.git
xlings install dsh:<plugin>            # 或 xim -i dsh:<plugin>
```

> 完整命令清单与链接见 `references/xlings-setup-and-links.md`
> 验收流程见 `references/testing-and-acceptance.md`
> 架构与决策依据见 `.agents/docs/2026-08-13-dsh-plugin-index-design.md`

---

## 0) 前置：环境可用

- 已安装 `xlings`（提供 `xim` / `xlings` / `xvm`）
- 已安装 `xim:dsh` 与 `xim:pnpm`（插件安装绕不开 pnpm）
- `lua5.4`（跑构建沙箱回归门）

---

## 1) 本仓库的包长什么样

### 1.1 描述符 = 纯数据

一个插件文件**没有 hook、没有 `xpm`、没有 `type`**：

```lua
package = {
    spec = "1",

    name = "dsh-tool-csv",
    description = "CSV 读写工具，给 dsh 提供表格类 tool",
    repo = "https://github.com/dsh-external/dsh-tool-csv",
    licenses = {"MIT"},
    authors = {"dsh-external"},

    status = "dev",                        -- dev / stable / deprecated
    categories = {"dsh-plugin", "tool"},
    keywords = {"dsh", "plugin", "csv"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-tool-csv",   -- package.json#name，展示 + remove 实参
        source = "github",                            -- github | npm
        origin  = "dsh-external/dsh-tool-csv",
        versions = {
            ["0.0.1"] = { ref = "db0a5a14403a8fb6ad9345d2163447a645e32279" },
        },
        latest = "0.0.1",
        needs_build = false,                          -- 有 scripts.prepare 就是 true
        -- patch = "./bundle/cordis.patch.yml",       -- 仅当不是默认路径时才写
    },
}
```

### 1.2 `dsh.*` 字段规则（**硬约束**）

| 字段 | 规则 |
|---|---|
| `bundle_name` | 取自上游 `package.json#name`。**只用于展示和 `remove`，绝不作为安装 spec** |
| `source` | `github`（默认）或 `npm` |
| `origin` | github 源写 `owner/repo`；npm 源写包名 |
| `versions[v].ref` | github 源**必须**是 40 位小写 hex commit sha |
| `latest` | 必须是 `versions` 里真实存在的键 |
| `needs_build` | 上游根 `package.json` 有 `scripts.prepare` 即为 `true` |

**为什么不能用裸包名安装**：生态里有 36 个社区仓库把自己命名成 `@deepseek-ai/xxx`，
而这些名字在 npm 上并不存在。今天裸名安装会 404；等官方真发了同名包，
它会**静默解析到完全不同的代码**。所以索引永远记 `owner/repo#sha`。
（这条也是上游 `docs/user/develop/basic/publish.md` 自己的建议：
"pin a commit so a later push cannot silently change what runs"。）

### 1.3 版本键的产生规则

| 源 | 版本键 | 递给 pnpm 的坐标 |
|---|---|---|
| npm | npm 上真实存在的版本号 | `<origin>@<version>` |
| github | `package.json#version`；同一个 version 出现第二个 sha 时追加 `+<sha[:7]>` | `github:<origin>#<40位sha>` |

上游社区包的 `version` 字段既不唯一也不单调，**不能直接当分发坐标**。
两列分开是有意的：左列给人看，右列给 pnpm。

---

## 2) 不要碰 template.lua，除非范式真的变了

`template.lua` 是全仓 169+ 个包共用的唯一生命周期实现。改它 = 改所有包。

只有以下情况才动它：
- 上游改了 `dsh plugin` 的命令形状
- 上游改了 profile / bundle 清单的结构
- 发现某个 hook runtime 陷阱（见 §3）

**加一个插件时改 `template.lua` 几乎总是错的**——如果某个包需要特殊处理，
先问：这是描述符能表达的差异（多加一个 `dsh.*` 字段），还是真的是范式差异？

---

## 3) hook 与 Lua 边界（**这一节是用生产事故换来的**）

### 3.1 两个 Lua 运行时，别搞混

| 运行时 | 跑什么 | 可用面 |
|---|---|---|
| **构建沙箱**（libxpkg plain-Lua，xlings ≥ 0.4.52） | `pkgindex-build.lua` | 完整 Lua stdlib + `os.scriptdir/os.files/os.isdir/io.readfile/io.writefile/path.*` 的**桩** + `cprint` 桩 |
| **hook runtime** | `template.lua` 里的 `installed/install/config/uninstall` | `xim.libxpkg.*` + 标准 Lua + 部分 xmake 原语 |

**构建沙箱里 `cprintf` / `try-catch` / `raise` / `os.getwinsize` / `path.relative` 全是 nil。**
踩到任何一个，`install()` 就死，错误被调用方吞掉，**构建出来的索引静默丢掉全部 xpm 段**，
然后所有走 artifact 路径的用户 `xlings install dsh:<pkg>` 全挂。d2x 在 2026-07-14 真踩过。

所以 `pkgindex-build.lua` 里每个非共享原语都要 feature-detect：

```lua
if type(cprintf) == "function" then ... elseif io and type(io.write) == "function" then ... end
if type(pcall) == "function" then ok, err = pcall(f) else try { f, catch { ... } } end
if type(raise) == "function" then raise(msg) else error(msg) end
```

**回归门**：`lua5.4 tests/libxpkg_sandbox_harness.lua .` 必须进 CI。
它复刻那个沙箱并断言模板真的被追加上了。这是这套机制唯一的保护。

### 3.2 hook runtime 里没绑定的东西会静默毁掉安装

| 写法 | 现象 | 换成 |
|---|---|---|
| `os.exists(p)` | `attempt to call a nil value (field 'exists')` | `os.isdir(p) or os.isfile(p)` |
| `os.arch()` | 返回 nil | 从 `pkginfo.install_file()` 推导 |

危险在**表现形式**：hook 抛错后安装目录里往往只剩一个 `.xpkg.lua`，
而外层可能仍然打印 `✓ N package(s) installed`。
`raise()` **也不进汇总**（只有 Lua 运行时错误会浮出来）。

→ 所以每个 hook 结尾都要**断言真正的产物**，不能只 `return true`。
本仓库的做法是 `config()` 结尾 `return installed()`，
而 `installed()` 去读 `$DSH_HOME/profiles/<p>/package.json`。

### 3.3 "安装目录是空的"最常见的原因不是 hook 有问题

**xlings 在同名同版本已经装在另一个 namespace 下时，会整个跳过 install hook，并且照样打印成功。**
测之前先清两边：

```bash
rm -rf ~/.xlings/data/xpkgs/{dsh,local}-x-<pkg>/<version>
```

另外：往 local index 里放两个 `package.name` 相同的文件，
会让**整个 local repo 静默从搜索路径消失**。删掉重复文件即恢复。

### 3.4 import 规范

只用新版 API：

```lua
import("xim.libxpkg.pkginfo")
import("xim.libxpkg.system")
import("xim.libxpkg.log")
```

避免 `xim.base.runtime` / `common` / `platform` / `core.*` / `detect.*`。

---

## 4) 隔离合规（禁止事项）

- ❌ `os.exec("xvm add ...")` / `os.exec("xvm remove ...")`
- ❌ 改 `.bashrc` / shell profile
- ❌ `os.addenv("PATH")` / `os.setenv("PATH")`
- ❌ `apt install` / `brew install` / `pacman -S`
- ❌ 删除 `$DSH_HOME` 下的任何用户数据

依赖走 `xpm.<platform>.deps`（本仓库由模板统一写成 `{"xim:dsh", "xim:pnpm"}`）。

### 4.1 dsh 侧专属约束

| 约束 | 原因 |
|---|---|
| `xvm_enable = false` | dsh 插件**不提供任何可执行文件**，没有 shim 可注册 |
| `uninstall()` 只调 `dsh plugin remove` | `$DSH_HOME` 是用户数据，本索引从未创建过它 |
| `needs_build = true` 的包必须显式授权 | `prepare` 脚本 = 在用户机器上执行该包代码，且不在 agent 沙箱内。没有 `DSH_ALLOW_BUILDS=1` 就失败退出，**不静默授权** |
| profile 由 `DSH_PROFILE` 决定，缺省 `web` | profile 是本生态唯一的并存/切换轴 |

---

## 5) 新增一个插件的标准流程

1. 确认它**真的是 bundle**：上游根 `package.json` 有 `dsh.bundle`。
   没有的话它只是个普通依赖（library），装了不激活任何层——不收录，或标 `kind = "library"`。
2. 取 40 位 sha：`gh api repos/<owner>/<repo>/commits/<branch> --jq .sha`
3. 取 `needs_build`：根 `package.json` 是否有 `scripts.prepare`
4. 写 `pkgs/<首字母>/<name>.lua`（只有数据）
5. 跑静态检查 + 构建沙箱回归门
6. 隔离 `DSH_HOME` + 隔离 `XLINGS_HOME` 真装真卸一遍（§ references）
7. 按 `pr-workflow` skill 提 PR

---

## 6) PR 硬性要求

PR 描述必须包含：

1. 插件用途 + 上游仓库
2. **pin 的 sha 和它对应的 upstream version**
3. `needs_build` 是否为 true；若是，说明为什么值得收录
4. 装进哪个 profile、装完 `--dump-config` 里能否看到该层
5. 本地验证结果（静态 / 沙箱 / 真装真卸）
6. 卸载后 profile 清单是否干净

提交格式 `<type>(<scope>): <description>`，例如
`feat(pkg): add dsh-tool-csv 0.0.1` / `fix(template): assert profile manifest in installed()`。
