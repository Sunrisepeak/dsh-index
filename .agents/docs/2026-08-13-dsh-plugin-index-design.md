# dsh-index 设计方案：DeepSeek Harness 插件生态的 xlings 包索引

> 编写日期：2026-08-13
> 目标仓库：`https://github.com/Sunrisepeak/dsh-index`
> 命名空间：**`dsh`**（`xim --add-indexrepo dsh:<url>` / `xlings install dsh:<plugin>`）
> 参照实现：`openxlings/xim-pkgindex`（索引 + 网站）、`d2learn/xim-pkgindex-d2x`（index build 模板机制）

---

## 0. 一句话结论

dsh 插件生态在 2026-08-09 之后**只剩一条官方分发通道**——profile bundle，
安装/更新/卸载全部是 `dsh plugin --profile <p> <pnpm 动词> ...` 的同一条命令形状；
实测 281 个 `topic:dsh-plugin` 仓库中 **169 个是可直接安装的 bundle，其中 166 个（98%）
连 patch 路径都是同一个 `./cordis.patch.yml`**。

范式统一到这个程度，意味着**每个插件的 xpkg 不需要写任何 hook**：
`pkgs/**/*.lua` 只写数据，全部生命周期由一份 `template.lua` 提供，
用 d2x 那套 `pkgindex-build.lua` 在索引构建期追加。

---

## 1. 背景与目标

### 1.1 已完成的前置工作

`xim:dsh` 已进入 xlings 官方索引（openxlings/xim-pkgindex#617，2026-08-13）：

- `latest -> 0.1.0-rc.6`，另跟踪 `0.1.0-rc.3` 作为可切换 pin
- 走 npm 通道（上游无 GitHub release / 无 git tag，唯一发布渠道是 `@deepseek-ai/dsh`）
- `deps = {"xim:node", "xim:npm"}`；**pnpm 故意不是硬依赖**（见 §3.4）

本设计负责的是**它的插件生态**。

### 1.2 目标

1. 一个独立的 xlings 包索引仓库 `dsh-index`，命名空间 `dsh`，收录 dsh 插件；
2. 安装 / 更新 / 版本切换 / 卸载都能通过 `xlings` 完成；
3. 自动发现 + 自动更新流水线（发现新插件、跟进新版本，产出 PR）；
4. 一个自动部署的包索引网站（复用 `openxlings/xpkgindex`）；
5. 因为插件的安装/配置/卸载是统一范式，采用 **index build 机制 + 模板**，
   而不是给 169 个包各写一遍 hook。

### 1.3 非目标

- 不做 dsh 本体的分发（已由 `xim:dsh` 覆盖）；
- 不做插件的兼容性检测（`AdamPlatin123/awesome-dsh-plugins` 已经在做四维兼容矩阵 +
  运行级实测，本索引**消费**它的结论，不重复造）；
- 不做插件托管/镜像（第一期；见 §12 分期）。

---

## 2. 上游事实调研

> 本节所有结论都在本机实测过，或来自上游仓库中带 `Status: implemented` 的决策记录，
> 不是从二手文档推断的。实测命令与输出见 §2.4。

### 2.1 插件协议：三代并存 → 一代胜出

| 代 | 载体 | 现状 |
|---|---|---|
| `.dsh-plugin/package.json`（静态，repository-plugins） | `~/.dsh/config.yaml` 里写 `github:org/repo#<40位sha>&path:` | **2026-08-09 从主线删除** |
| `dsh.plugin.json`（plugin-registry 社区协议） | 独立清单 + 1061 行补丁挂进主仓库 | 社区补丁层，**从未进入官方树** |
| **`dsh.bundle` + profile `dsh.profile.bundles`** | npm 包声明 `dsh.bundle.patch`，profile 有序组合 | **当前唯一官方通道** |

删除决策的原文（`.agents/notes/implemented/simplification/2026-08-09-remove-repository-plugin.md`，
Status: implemented）：

> DeepSeek Harness has one standalone external-Plugin distribution path: installable
> profile bundles. […] The `@deepseek-ai/dsh-repository-plugin` package, `.dsh-plugin`
> authoring format, `dsh-plugin-prepare` executable, generated wrapper, immutable
> repository cache, base `repository-plugins` row […] are removed. **No compatibility
> parser or migration from `.dsh-plugin` is retained under the pre-release
> compatibility policy.**

这条对索引设计是决定性的：**只需要支持 bundle 一种形态**，
且不需要为 `.dsh-plugin` 留兼容分支。
（`awesome-dsh-plugins` 的 `analysis/plugin-formats.md` 写于 08-05，
早于这次删除，其"两代并存"结论已被上游 08-09 的决策取代——引用它时要注意日期。）

### 2.2 概念模型：bundle 与 profile

- **bundle** = 一个 npm 包，`package.json` 里声明
  `"dsh": { "bundle": { "patch": "./cordis.patch.yml" } }`。它贡献**一层配置补丁**。
- **profile** = 目录 `$DSH_HOME/profiles/<name>`，含
  `package.json`（pnpm 管理的 `dependencies` + `dsh.profile.bundles` 有序列表）、
  `cordis.patch.yml`（用户自己那层）、`pnpm-lock.yaml`、`pnpm-workspace.yaml`。

组合顺序（后层覆盖前层，按 row `id` 覆盖，`config` 整体替换而非深合并）：

```
dsh.profile.bundles 顺序 → profile 的 cordis.patch.yml → $DSH_HOME/cordis.patch.yml → --patch 覆盖层
```

`$DSH_HOME` 默认 `~/.dsh`，可用 `DSH_HOME` 覆盖（实测代码：`dsh-home-paths`）。

### 2.3 统一范式：一条命令形状

```
dsh plugin --profile <name> <args...>    # 薄 pnpm 转发器
```

它做三件事：首次使用时初始化 profile（以 `@deepseek-ai/dsh-base` 为第一个 bundle）→
在 profile 目录里跑 `pnpm <args...>` → 用已安装包的 bundle 声明**对账**
`dsh.profile.bundles`。

于是：

| 动作 | 命令 |
|---|---|
| 安装 | `dsh plugin --profile p add <spec>` |
| 卸载 | `dsh plugin --profile p remove <pkg-name>` |
| 更新 | `dsh plugin --profile p update <pkg-name>` / 重新 `add` 一个新 spec |
| 查询 | `dsh plugin --profile p why <pkg-name>`（任意 pnpm 动词都透传） |

`<spec>` 是**任意 pnpm 规格**：`pkg@version`、`github:owner/repo#<sha>`、
`./local-dir`、`./pkg-0.1.0.tgz`。

### 2.4 实测记录（2026-08-13，本机）

隔离 `DSH_HOME`，用 `xim` 装出来的 `dsh@0.1.0-rc.6`：

```console
$ dsh plugin --profile demo add "github:dsh-external/dsh-tool-csv#db0a5a14403a8fb6ad9345d2163447a645e32279"
dsh: initialized profile demo at .../dshhome/profiles/demo
+ @deepseek-ai/dsh-tool-csv github:dsh-external/dsh-tool-csv#db0a5a1...
Done in 11.3s using pnpm v11.0.5
```

生成的 profile 清单（**`bundles` 是 dsh 自己对账加进去的，不是我写的**）：

```json
{
  "name": "dsh-profile-demo",
  "private": true,
  "dependencies": {
    "@deepseek-ai/dsh-tool-csv": "github:dsh-external/dsh-tool-csv#db0a5a14403a8fb6ad9345d2163447a645e32279"
  },
  "dsh": { "profile": { "bundles": ["@deepseek-ai/dsh-base", "@deepseek-ai/dsh-tool-csv"] } }
}
```

层确实被组合进去了：

```console
$ dsh --profile demo --dump-config | grep -n "== "
1:# == @deepseek-ai/dsh-base
314:# == @deepseek-ai/dsh-tool-csv
```

卸载干净（依赖和层同时消失）：

```console
$ dsh plugin --profile demo remove @deepseek-ai/dsh-tool-csv
- @deepseek-ai/dsh-tool-csv ...
$ cat profiles/demo/package.json | jq .dsh.profile.bundles
["@deepseek-ai/dsh-base"]
```

**结论：add / dump-config / remove 三段闭环成立，范式可以直接被模板化。**

### 2.5 生态实测普查（2026-08-13）

发现入口用的是上游 README 自己指定的那个——
"Add the `dsh-plugin` topic to your plugin repository for discoverability"：

```
GET /search/repositories?q=topic:dsh-plugin   → 281 个仓库
```

对全部 281 个仓库拉根 `package.json` 后的统计：

| 指标 | 数量 | 占比 |
|---|---:|---:|
| `topic:dsh-plugin` 仓库总数 | 281 | 100% |
| 有根 `package.json` | 238 | 85% |
| **声明 `dsh.bundle`（可直接安装）** | **169** | **60%** |
| 其中 `scripts.prepare` 存在（git 装需要 allowBuilds） | 38 | 22% |
| patch 路径 = `./cordis.patch.yml` | 166 / 169 | **98%** |
| 包名跨仓库重复 | 0 | — |
| 不同作者（owner） | 67 | — |

包名 scope 分布（169 个 bundle）：

| scope | 数量 | 说明 |
|---|---:|---|
| 无 scope | 66 | |
| `@deepseek-ai/` | 36 | **社区仓库占用官方 scope，npm 上并不存在** |
| `@dsh-external/` | 35 | |
| 其余（`@huanlin/`、`@loserfox/`…） | 32 | 长尾 |

npm 发布率（按 star 排序的前 40 个 bundle 抽样）：

| 状态 | 数量 |
|---|---:|
| npm 上能查到 | 5 |
| npm 上查不到 | 35 |

**两条对设计有硬约束的事实：**

1. **npm 不是这个生态的主通道**（抽样 12.5%）。GitHub 才是。
2. **包名不可信**。36 个社区仓库把自己命名进 `@deepseek-ai/` scope，
   而 DeepSeek **确实拥有这个 scope**——实测：
   `@deepseek-ai/dsh-base` 在 npm 上存在（`latest 0.0.1-rc.1` / `next 0.1.0-rc.6`），
   而社区仓库自称的 `@deepseek-ai/dsh-tool-csv` 返回 `{"error":"Not found"}`。
   今天裸名 `pnpm add @deepseek-ai/dsh-tool-csv` 会 404；
   等 DeepSeek 哪天真发了同名包，同一条命令会**静默解析到完全不同的代码**。

→ **索引必须永远记录带 owner/repo 的 source spec 并 pin commit sha，
绝不能只记包名。**（这也正好和上游 publish.md 的建议一致：
"pin a commit (`github:you/hello-plugin#<sha>`) so a later push cannot silently
change what runs"。）

### 2.6 版本与"版本切换"在 dsh 侧到底是什么

上游**没有**插件版本管理器。能拿到的版本轴只有两条：

1. **spec 本身**：`github:o/r#<sha>` 或 `pkg@1.2.3`。切版本 = 换 spec 重新 `add`，
   pnpm 的 lockfile 记录结果。
2. **profile**：`$DSH_HOME/profiles/<name>` 是完全独立的依赖树 + 组合层。
   同一个插件的两个版本可以同时存在于两个 profile，互不干扰。

`package.json#version` 只是作者自己写的字符串，**不是**可解析的分发坐标——
169 个 bundle 全都有 version 字段，但其中只有约 1/8 真的能按这个版本从 npm 装到。

→ **设计取向：把 sha/spec 当作真实版本，`package.json#version` 当作展示用标签；
把 profile 当作 xlings 语义下的"版本切换 / 并存"轴。**

---

## 3. 阻抗失配与架构决策

### 3.1 失配点

| | xim / xlings 模型 | dsh 插件模型 |
|---|---|---|
| 安装产物 | `~/.xlings/data/xpkgs/<ns>-x-<name>/<ver>/` 下的不可变 payload | `$DSH_HOME/profiles/<p>/node_modules`，pnpm 拥有 |
| 版本切换 | `xvm use <name>@<ver>` 改 shim | 换 spec 重装 / 换 profile |
| 依赖解析 | libxpkg 的 `deps` | pnpm + lockfile |
| 卸载 | 删 payload + `xvm.remove` | `dsh plugin remove` 改 profile 清单 |
| 注册面 | 可执行程序（shim） | **没有可执行程序** |

最后一行是关键：**dsh 插件不提供任何命令**，所以 `xvm_enable` 必须是 `false`，
xvm 在这里没有位置。这不是缺陷，是形态差异——索引管的是"这个 profile 里有哪些 bundle"，
不是"PATH 上有哪个可执行文件"。

### 3.2 三个候选架构

**A. xim 作为 `dsh plugin` 的前端（推荐）**
`install()` 空转，`config()` 调 `dsh plugin --profile <p> add <spec>`，
`uninstall()` 调 `dsh plugin --profile <p> remove <name>`。xpkg 是一条**声明式记录**。

- ✅ profile 只有一个真相源（pnpm 的 lockfile）；`dsh` 自己负责 bundles 对账
- ✅ 用户手敲的命令和索引跑的命令**逐字相同**，出问题好排查
- ✅ 上游改了对账逻辑，索引不用跟着改
- ❌ payload 目录是空的；xvm 用不上
- ❌ config() 期需要 pnpm + 网络

**B. xim 拥有 payload，profile 用 `link:` 指过去**
`install()` 把包抓进 payload，`config()` 在 profile 里 `link:` 它。

- ✅ 有真实 payload，可 hash、可镜像、可离线
- ❌ **上游明确否决过 `link:`**（profile-plugin-bundles 决策的 Alternatives 一节：
  "pnpm cannot version, install, or update a `link:` into the installation, it embeds a
  machine path in a user file, and it breaks when the installation moves"）。
  给 in-box bundle 否决的理由，对外部 bundle 一字不差地成立。
- ❌ pnpm 不再拥有依赖树，两套解析器打架

**C. xim 产出 tarball，`dsh plugin add <payload>/<pkg>.tgz`**
上游支持且**不需要 build 授权**（publish.md："Ship a tarball from `pnpm pack`;
users run `dsh plugin add ./hello-plugin-0.1.0.tgz`"）。

- ✅ payload 真实、可 sha256、可镜像、可离线、绕开 `allowBuilds` 授权
- ❌ 38 个带 `prepare` 的 TS 插件，tarball 必须**先构建**才有 `lib/`——
  等于索引侧要跑一条构建流水线，还要为 169 个包各建一个发布位
- ❌ 第一期做不完

### 3.3 决策

> **D1：第一期采用架构 A。C 作为第二期针对"已在 npm 发布"和"高频使用"插件的优化，
> 走 xlings-res 镜像位。B 永久否决。**

理由：A 是唯一能在不复制上游任何逻辑的前提下，当天就跑通的形态；
它把"包管理"留给 pnpm，把"发现 + 声明 + 版本记账 + 网站"留给 xlings——
各自做自己擅长的事。C 的收益（离线、镜像、免授权）真实但需要构建基础设施，
应该在索引本身站住之后再叠加，而且**只对少数高频包值得**。

### 3.4 pnpm 依赖的处理

`dsh plugin` 需要 PATH 上有 pnpm（上游删除 repository-plugin 时明确接受了这个代价：
"Profile installation requires `pnpm` on the host `PATH`"）。

但 `xim:pnpm` 在 Linux/Windows 上只有 x86_64 资产（`archs = {"x86_64"}`），
而 dsh 本身是 JavaScript、node 能跑的地方都能跑。所以：

- `xim:dsh` **不把 pnpm 写进 deps**（已按此合入，见 #617）
- `dsh-index` 里的插件包**把 `xim:pnpm` 写进 deps**——插件安装本来就绕不开 pnpm，
  这里不存在"为可选功能牺牲架构"的问题
- aarch64 用户暂时装不了插件，这一点**在网站和 README 里明说**，不假装支持

> **D2：插件 xpkg 的 `deps = {"xim:dsh", "xim:pnpm"}`。
> aarch64 的缺口记录在案，等 xim:pnpm 补 arm64 资产后自动解决。**

### 3.5 profile 的选择

`dsh plugin` 强制要 `--profile`。索引装进哪个 profile？

> **D3：读环境变量 `DSH_PROFILE`，缺省 `web`。**
> profile 就是 xlings 语义下的"并存/切换"轴：
> `DSH_PROFILE=exp xlings install dsh:foo` 会在 `exp` profile 里装一份，
> 和 `web` 里的那份互不干扰。

在 `config()` 里读、在网站的安装命令里显式展示，不做隐式猜测。

### 3.6 `installed()` 以 profile 为准

用户完全可能绕过 xlings 直接 `dsh plugin remove`。若 `installed()` 相信 xim 自己的标记，
索引状态会和真相漂移。

> **D4：`installed()` 读 `$DSH_HOME/profiles/<p>/package.json`，
> 检查 `dependencies[<pkg>]` 是否存在且 spec 匹配。断言产物，不断言意图。**

这是 XPackage Spec V2 的 R4（assert on the artifact, not on the intent）
在这个索引里的具体落法。

### 3.7 构建脚本 = 代码执行，必须显式授权

38 个 bundle（22%）带 `scripts.prepare`。git 安装时 pnpm ≥10 会拒绝执行，
要求在 profile 的 `pnpm-workspace.yaml` 里写 `allowBuilds`。上游对此说得很直白：

> Treat that allowance as what it is: **permission to execute the package's code on your
> machine at install time**, outside any sandbox the agent runs under.

> **D5：索引在描述符里记录 `needs_build = true`。
> `config()` 只有在 `DSH_ALLOW_BUILDS=1` 时才写 `allowBuilds` 条目；
> 否则打印上游那条错误 + 需要授权的原因，然后失败退出——不静默授权。
> 网站上给这类插件挂显式徽标。**

xlings 不应该替用户点"同意执行任意代码"。

---

## 4. 仓库布局

```
dsh-index/
├── pkgs/<首字母>/<plugin>.lua        # 只有 package = {...} 数据，零 hook
├── template.lua                      # 共享 type/xpm/hooks，索引构建期追加
├── pkgindex-build.lua                # type = "auto-config"，d2x 那套构建器
├── tools/
│   ├── discover.py                   # topic:dsh-plugin 普查 → catalog.json
│   ├── sync.py                       # catalog.json → pkgs/**.lua 差分
│   └── catalog.json                  # 普查快照（R1：每个仓库一行，含 skipped）
├── tests/
│   ├── libxpkg_sandbox_harness.lua   # 构建沙箱回归门（照抄 d2x，见 §6.2）
│   ├── lib/{descriptor.py,assertions.py}
│   ├── test_descriptors.py           # 对全部 pkgs/**.lua 做 schema/lint
│   └── test_template.py              # 模板 + 描述符 → 合成包的静态检查
├── .xpkgindex.json                   # 网站配置
├── .xpkgindex/plugins/dsh.py         # 网站的 dsh 侧渲染插件
├── .github/workflows/
│   ├── ci.yml                        # 静态 / 隔离 / 索引注册
│   ├── build-sanity.yml              # 构建沙箱回归
│   ├── discover.yml                  # 定时普查 → 开 PR
│   └── pages.yml                     # 网站构建部署
├── .agents/{docs,skills}/            # 本文档 + xpkg 规范 skill
├── docs/                             # 网站渲染的文档页
└── README.md
```

---

## 5. 描述符 schema（`pkgs/**/*.lua`）

单个插件文件**只有数据**，没有 `type`、没有 `xpm`、没有任何 hook：

```lua
package = {
    spec = "1",

    name = "dsh-tool-csv",
    description = "CSV 读写工具，给 dsh 提供表格类 tool",
    repo = "https://github.com/dsh-external/dsh-tool-csv",
    licenses = {"MIT"},
    authors = {"dsh-external"},

    status = "dev",
    categories = {"dsh-plugin", "tool"},
    keywords = {"dsh", "plugin", "csv", "tool"},

    -- ── dsh 侧坐标，全部由 template.lua 消费 ──────────────────────
    dsh = {
        -- bundle 的 package.json#name。只做展示与 remove 时的实参，
        -- 不作为安装 spec —— 见 §2.5，这个名字在 npm 上未必存在。
        bundle_name = "@deepseek-ai/dsh-tool-csv",

        -- 安装源。github 永远 pin 40 位 sha。
        source = "github",              -- github | npm
        origin  = "dsh-external/dsh-tool-csv",

        -- 版本表。key 是索引对外的版本号（取自 package.json#version，
        -- 冲突时加 "+<sha 前 7 位>" 消歧），value 是真正的分发坐标。
        versions = {
            ["0.0.1"] = { ref = "db0a5a14403a8fb6ad9345d2163447a645e32279" },
        },
        latest = "0.0.1",

        -- 该包 git 安装时是否会跑 prepare（= 需要 allowBuilds 授权）
        needs_build = false,

        -- bundle patch 路径，98% 是默认值，只有例外才写
        -- patch = "./bundle/cordis.patch.yml",
    },
}
```

`npm` 源的形状：

```lua
    dsh = {
        bundle_name = "dsh-cc-tui",
        source = "npm",
        origin = "dsh-cc-tui",
        versions = { ["0.1.2"] = {} },   -- npm 版本号即坐标，无需 ref
        latest = "0.1.2",
        needs_build = false,
    },
```

### 5.1 版本键的产生规则

| 源 | 版本键 | 分发坐标 |
|---|---|---|
| npm | npm 上真实存在的版本号 | `<name>@<version>` |
| github | `package.json#version`，同 version 出现第二个 sha 时追加 `+<sha[:7]>` | `github:<origin>#<40位sha>` |

第二列是**索引对用户暴露的**，第三列是**递给 pnpm 的**。
两者分开，是因为社区 bundle 的 `version` 字段既不唯一也不单调，
不能直接当分发坐标用（§2.6）。

---

## 6. index build 机制

### 6.1 `template.lua`

被 `pkgindex-build.lua` 追加到每个 `pkgs/**/*.lua` 尾部。它负责补齐
`package.type` / `package.xpm` 和四个 hook：

```lua
-- dsh-index 公共模板（由 pkgindex-build.lua 追加）

package.type = "config"        -- 插件不产出可执行文件，是配置层
package.xvm_enable = false     -- 没有程序可注册，xvm 在这里没有位置
package.archs = {"x86_64"}     -- 受限于 xim:pnpm，见 D2

do
    local vers, xpm = package.dsh.versions, {}
    local plat = { linux = true, macosx = true, windows = true }
    for p in pairs(plat) do
        local t = { deps = {"xim:dsh", "xim:pnpm"},
                    ["latest"] = { ref = package.dsh.latest } }
        for v in pairs(vers) do t[v] = {} end   -- 空资源：不下载，由 pnpm 取
        xpm[p] = t
    end
    package.xpm = xpm
end

import("xim.libxpkg.pkginfo")
import("xim.libxpkg.system")
import("xim.libxpkg.log")

local function profile()  return os.getenv("DSH_PROFILE") or "web" end
local function dsh_home() return os.getenv("DSH_HOME")
                                 or path.join(os.getenv("HOME") or os.getenv("USERPROFILE"), ".dsh") end
local function profile_manifest()
    return path.join(dsh_home(), "profiles", profile(), "package.json")
end

-- 递给 pnpm 的分发坐标（§5.1 第三列）
local function spec(version)
    local e = package.dsh.versions[version]
    if package.dsh.source == "npm" then
        return package.dsh.origin .. "@" .. version
    end
    return "github:" .. package.dsh.origin .. "#" .. e.ref
end

-- D4：真相在 profile 的 package.json 里，不在 xim 的标记里
function installed()
    local f = io.open(profile_manifest(), "r")
    if not f then return false end
    local body = f:read("*a"); f:close()
    return body:find(spec(pkginfo.version()), 1, true) ~= nil
end

function install()
    return true      -- 无 payload；真正的取包在 config() 里由 pnpm 完成
end

function config()
    -- D5：构建脚本 = 代码执行，必须显式授权
    if package.dsh.needs_build and os.getenv("DSH_ALLOW_BUILDS") ~= "1" then
        log.error(("%s 在 git 安装时会执行自带的 prepare 构建脚本。\n"
               .. "这是在你的机器上执行该包代码的授权，且不在 agent 的沙箱内。\n"
               .. "确认信任后用 DSH_ALLOW_BUILDS=1 重新安装。"):format(package.name))
        return false
    end

    system.exec(("dsh plugin --profile %s add %s"):format(profile(), spec(pkginfo.version())))
    return installed()      -- R4：断言产物
end

function uninstall()
    system.exec(("dsh plugin --profile %s remove %s"):format(profile(), package.dsh.bundle_name))
    return true
end
```

> 上面是设计稿的形状，不是最终代码。落地时必须逐条过 §6.2 的沙箱约束
> （`os.getenv` / `io.open` 在构建沙箱里可用，但 hook 运行时的可用面要单独确认；
> `path.join` 在两个 runtime 都有）。

### 6.2 `pkgindex-build.lua` 与双 Lua 运行时

直接照搬 d2x 的实现，只改 `NS = "dsh"`。它的关键约束（d2x 用一次生产事故换来的）：

> xlings ≥ 0.4.52 **不再用 xmake 跑这个脚本**，而是在 libxpkg 的最小 plain-Lua
> 沙箱里跑。`cprintf` / `try-catch` / `raise` / `os.getwinsize` / `path.relative`
> 在那里全是 nil，`install()` 一死错误被调用方吞掉，**构建出来的索引会静默丢掉
> 全部 xpm 段**，然后所有走 artifact 路径的用户 `xlings install dsh:<pkg>` 全挂。

所以：

- 每个非共享原语都要 feature-detect（`type(x) == "function"` 再用）；
- **`tests/libxpkg_sandbox_harness.lua` 必须一起搬过来并进 CI**，
  它复刻那个沙箱并断言模板真的被追加上了。这是这套机制唯一的回归门。

### 6.3 为什么值得上模板

169 个包 × 4 个 hook，手写就是 169 份会各自腐化的副本。
而 §2.5 的数据说明它们的安装范式**逐字相同**（98% 连 patch 路径都一样）。
模板把"范式"收敛成一份可测的代码，把"数据"留在描述符里——
上游哪天改了 `dsh plugin` 的用法，改一个文件，169 个包一起跟上。

---

## 7. 自动更新流水线

```
┌────────────┐   ┌───────────┐   ┌────────┐   ┌────┐   ┌────┐
│ discover.py│ → │catalog.json│ → │sync.py │ → │ PR │ → │ CI │ → merge
└────────────┘   └───────────┘   └────────┘   └────┘   └────┘
   topic 普查      总账（R1）      差分改 pkgs               │
                                                          ↓
                                                    pages.yml → 网站
```

### 7.1 `discover.py` — 发现

1. `GET /search/repositories?q=topic:dsh-plugin`（分页），
   这是上游 README 自己指定的发现入口；
2. 对每个仓库拉默认分支根 `package.json` + HEAD sha；
3. 判定：有 `dsh.bundle` → `bundle`；有 package.json 无 bundle → `library`；
   都没有 → `not-a-package`；404 → `gone`；
4. 交叉核对 `AdamPlatin123/awesome-dsh-plugins` 的 `.support-status.json`
   与最新兼容矩阵，把兼容性结论**引用**进 catalog（不重算）。

> **R1（总账是完备的）**：catalog.json 给**每一个**扫到的仓库写一行，
> 包括 `skipped` / `gone`。"这个仓库被考虑过吗"必须不重跑就能回答——
> 否则"没收录"和"没扫到"就分不清了。

### 7.2 `sync.py` — 差分

- 新仓库 → 新建 `pkgs/<letter>/<name>.lua`
- 已有仓库 HEAD sha 变了且 `version` 变了 → 追加版本键，移动 `latest`
- HEAD 变了但 `version` 没变 → 追加 `<version>+<sha[:7]>` 键（§5.1）
- 仓库消失 → **不删**，标 `status = "deprecated"` 并保留最后已知 sha
  （已装的用户不能因为上游删库就装不回去）
- 全程只改 `pkgs/**`，绝不手改 `template.lua`

### 7.3 workflow

照 `xim-pkgindex` 的模式：周期与限流集中在 `.github/dsh-ci.yml`，
描述符里不写周期。生态每天在动（08-13 当天就新增了 30+ 仓库），
建议 `interval: 1d`、`max_repos_per_run` 限流、`request_budget` 兜底。

**PR 必须是人可 review 的**：一次 PR 只带一类变更（新增 / 版本跟进 / 状态变更），
描述里带 catalog 的 diff 摘要。

---

## 8. 包索引网站

直接复用 `openxlings/xpkgindex`——`xim-pkgindex` 的站点就是它生成的，
`pip install git+https://github.com/openxlings/xpkgindex.git`，
`xpkgindex generate . --output site`，GitHub Pages 部署。

需要写的只有两个文件：

**`.xpkgindex.json`** — 站点标题/主题/语言/文档页/生态方，
以及关键的安装命令模板：

```json
{
  "install_command_template": "xlings install dsh:{ref}@{version}",
  "pkgs_dir": "pkgs",
  "plugins": [".xpkgindex/plugins/dsh.py"],
  "base_url": "https://sunrisepeak.github.io/dsh-index"
}
```

**`.xpkgindex/plugins/dsh.py`** — 照 `xim.py` 的形状，把 dsh 特有的面渲染出来：

| 面 | 来源 | 为什么要 |
|---|---|---|
| bundle / library | `dsh.bundle` 是否存在 | library 装了不激活任何层，用户要能一眼看出 |
| 上游仓库 + pin 的 sha | `dsh.versions[v].ref` | 可审计：装的到底是哪次提交 |
| `needs_build` 徽标 | `dsh.needs_build` | 这是代码执行授权，必须显眼（D5） |
| 目标 profile | `DSH_PROFILE` 缺省值 | 安装命令要能直接抄走 |
| 兼容状态 | awesome-dsh-plugins 引用 | 生态里唯一在跑的兼容情报 |

站点触发条件和 `xim-pkgindex` 一致：`pkgs/**`、`.xpkgindex*`、`docs/**` 变更即重建。
**注意 `fetch-depth: 0`**——xpkgindex 检测到 shallow clone 会静默跳过增长曲线、
历史线和贡献者列表。

---

## 9. CI 与测试矩阵

| 层 | 内容 | 需要 xlings |
|---|---|---|
| L0 静态 | 描述符 schema：必填字段、`dsh.*` 形状、版本键与 `latest` 自洽、sha 是 40 位 hex | 否 |
| L0' 沙箱 | `lua5.4 tests/libxpkg_sandbox_harness.lua .`（§6.2） | 否 |
| L1 索引注册 | `xlings config --add-xpkg` 对合成后的包成立 | 是 |
| L2 隔离合规 | 不写 `.bashrc`、不改 PATH、不 `os.exec("xvm ...")`、不调系统包管理器 | 否 |
| L3 生命周期 | 隔离 `DSH_HOME` + 隔离 `XLINGS_HOME` 真装真卸**抽样**若干包 | 是 |
| L4 功能 | `dsh --profile <p> --dump-config` 里出现该 bundle 的层 | 是 |

L3/L4 **不可能全量跑**（169 个包 × 每次 pnpm 安装）。取样规则写死在 workflow 里，
并且**明确 log 出没跑的部分**——静默截断会被读成"全覆盖了"。

---

## 10. 安全与失败模式

| 风险 | 触发 | 处置 |
|---|---|---|
| 包名劫持 | 36 个仓库占用 `@deepseek-ai/` scope（§2.5） | 索引只认 `owner/repo#sha`，绝不用裸包名安装 |
| 上游改写历史 | force push 让 sha 指向别的代码 | pin 40 位 sha；sync 检测到已收录 sha 消失时**报警而不是静默跟进** |
| 安装期任意代码执行 | 38 个包的 `prepare` | D5：`DSH_ALLOW_BUILDS=1` 显式授权，网站挂徽标 |
| 索引静默丢 xpm | 构建脚本踩到 xmake-only 原语 | §6.2 的沙箱回归门进 CI |
| xim 与 profile 状态漂移 | 用户手动 `dsh plugin remove` | D4：`installed()` 读 profile 清单 |
| 上游协议再变 | 本季度已经变过两次 | 范式收敛在一份 `template.lua`，改一处即可 |
| aarch64 装不了 | `xim:pnpm` 只有 x86_64 | README + 网站明说，不假装支持（D2） |

---

## 11. 与相邻项目的边界

| 项目 | 它负责 | 本索引不做 |
|---|---|---|
| `openxlings/xim-pkgindex` | `xim:dsh`、`xim:node/npm/pnpm` 本体 | 不重复收录 dsh 本体 |
| `AdamPlatin123/awesome-dsh-plugins` | 兼容矩阵、运行级实测、每日摘要 | 不重算兼容性，只引用 |
| `deepseek-ai/deepseek-harness` | bundle/profile 协议本身 | 不复制上游对账逻辑 |
| `openxlings/xpkgindex` | 站点生成器 | 不自研网站 |

---

## 12. 分期实施

**第一期（可用）**
1. `pkgindex-build.lua` + `template.lua` + 沙箱 harness + build-sanity CI
2. 手工收录 10~20 个高 star bundle，跑通 add / dump-config / remove 全链
3. `.xpkgindex.json` + `dsh.py` + Pages 部署
4. README：`xim --add-indexrepo dsh:https://github.com/Sunrisepeak/dsh-index.git`

**第二期（自动）**
5. `discover.py` + `catalog.json`（R1 总账）
6. `sync.py` + 定时 PR workflow
7. L3/L4 抽样安装测试进 CI

**第三期（加固）**
8. 架构 C：对高频 / 已发 npm 的包做 tarball 镜像（离线 + 免 build 授权）
9. 向 `openxlings/xlings` 提 PR，把 `dsh` 加进 `xim-indexrepos.lua` 成为一等索引
10. aarch64：推动 `xim:pnpm` 补 arm64 资产

---

## 13. 未决问题

1. **`type` 取值**：插件是配置层，`type = "config"` 语义最近，但 xim 的 `config` 类型
   原本指"写用户工具配置的包"。是否需要给索引引入新 type，需要和 xlings 侧确认。
2. **`system.exec` 在 hook 里调 `dsh`**：`dsh` 是同一次安装里刚由 `xim:dsh` 装的，
   config() 期它是否已在 PATH 上、还是要从 payload 解析（R6：内部消费者绑 payload
   而不是 view），需要实测确认。
3. **`os.getenv` 在 hook runtime 的可用性**：`DSH_PROFILE` / `DSH_HOME` / `DSH_ALLOW_BUILDS`
   三个读取点都依赖它，落地前必须实测（xpkg-creater skill 已记录多个"hook runtime
   里没绑定的东西会静默毁掉安装"的先例）。
4. **169 个包全量收录还是精选**：全量意味着网站上 40% 是没人用的空壳。
   建议 catalog 全量（R1），`pkgs/` 收录设 star / 兼容性门槛，门槛写进 `sync.py` 且可调。
