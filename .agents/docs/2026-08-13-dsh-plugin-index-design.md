# dsh-index 设计方案：DeepSeek Harness 插件生态的 xlings 包索引

> 编写日期：2026-08-13（2026-08-14 按 C/A 混合架构决策修订）
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

**架构是 C/A 混合，分界线是许可证：**

| | 走 C：镜像（127/169） | 走 A：直连（42/169） |
|---|---|---|
| 判据 | 许可证允许再分发 | 无 license（29）/ 不明（13） |
| xpm 版本项 | `{url = {GLOBAL, CN}, sha256}` | `{}` |
| CN 加速 | ✅ | ❌ 结构上不可能（§3.3） |
| 上游删库后 | ✅ 仍可装 | ❌ |
| `xlings use <plugin> <ver>` | ✅ | ❌ |
| `prepare` 需用户授权 | ❌ 不需要 | ⚠️ 需要 |

两条路线**共用同一份 `template.lua`**，分支点只有 `dsh.mirror` 存不存在——
所以不是"先做 A 再做 C"，而是第一期就把两条都跑通。

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

→ **设计取向：把 sha/spec 当作真实版本，`package.json#version` 当作展示用标签。**

至于 xlings 侧用什么做"版本切换"轴，取决于架构选型，见 §3.3 决策 2：
走 A 只能靠 profile 并存，走 C 则 `xvm use <plugin> <ver>` 成立。

### 2.7 许可证普查（决定谁能进镜像）

对 169 个 bundle 逐仓查 GitHub 的 `license.spdx_id`：

| License | 数量 | 可再分发（镜像） |
|---|---:|---|
| MIT | 82 | ✅ |
| BSD-3-Clause | 42 | ✅ |
| Apache-2.0 | 2 | ✅ |
| GPL-3.0 | 1 | ✅（copyleft，tarball 即源码，随附 LICENSE 即可） |
| **NONE（无 LICENSE 文件）** | **29** | ❌ **默认保留所有权利，未授予分发权** |
| NOASSERTION（无法识别） | 13 | ⚠️ 需人工判读，判读前按 ❌ 处理 |

**127 / 169 可镜像。** 这个比例直接决定了镜像不可能是全量的——见 §3.3.1。

### 2.8 生态已经从 dsh-external 迁走了（发现源必须双源）

`dsh-external` 曾是插件集散地，`awesome-dsh-plugins` 的目录几乎全指向它。
实测今天：

| | |
|---|---:|
| `topic:dsh-plugin` 搜到的 281 个仓库中，属于 `dsh-external` 的 | **0** |
| 包名仍带 `@dsh-external/`、仓库已迁到个人名下 | 35 |
| 包名带 `@deepseek-ai/`、仓库不在 dsh-external | 36 |
| 现在的不同 owner 数 | **67**（omdsh-dev 51、HuanLinOTO 11、bill9109 5…） |

```
0xsline/dsh-spotlight        pkg=@dsh-external/dsh-spotlight
Anionex/dsh-vision-toolkit   pkg=@dsh-external/dsh-vision-toolkit
bill9109/dsh-webbridge       pkg=@dsh-external/dsh-webbridge
```

仓库搬走了、包名里的旧 scope 没跟着改——迁移最典型的残留。
`dsh-external/toybox`、`dsh-external/dsh-superpowers` 现已 404。

**但两个发现源各有盲区，而且互补：**

| 源 | 覆盖 | 盲区 |
|---|---|---|
| `topic:dsh-plugin` 搜索 | 281 个，67 个 owner | **搜不到 `dsh-external/*`** |
| `awesome-dsh-plugins` | 286 条 | 几乎全指向 dsh-external，大量已 404 |

`dsh-external/dsh-tool-csv` 确实还在、topic 也带着 `dsh-plugin`，
但它**不出现在搜索结果里**——该 org 的 `public_repos` 读出来是 0，
GitHub 搜索索引不收它的仓库，尽管按 URL 直接读得到。

→ **`discover.py` 必须同时扫两个源、取并集、每条记来源**（§7.1）。
→ **仓库会换 owner**：GitHub 会重定向一段时间，pnpm 顺着重定向照装不误，
于是索引记的坐标和实际装的东西**静默脱钩**。必须按 **repo id** 而非 `full_name`
检测 move。

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
  等于索引侧要跑一条构建流水线
- ❌ **只对许可证允许再分发的包成立**（§2.7）

### 3.3 决策：C/A 混合，license 是判据

> **D1：能镜像的走 C，不能镜像的走 A 并在网站上标注。B 永久否决。**
>
> | | 走 C（可镜像） | 走 A（兜底） |
> |---|---|---|
> | 判据 | 许可证允许再分发 | 无许可证 / 许可证不明 |
> | 今日规模 | **127 / 169** | 29 无 license + 13 待核 |
> | CN 加速 | ✅ GLOBAL/CN 双镜像 | ❌ 直连上游 |
> | 上游删库后 | ✅ 仍可安装 | ❌ 装不回来 |
> | `xlings use <plugin> <ver>` | ✅ payload 即切换对象 | ❌ 只能换 profile |
> | `prepare` 构建授权 | ✅ 不需要（CI 里已构建完） | ⚠️ 需 `DSH_ALLOW_BUILDS=1` |

这个决策一开始写错过，纠正的过程值得留下来：初版把 C 排到第三期，理由是
"当天就能跑通"。三条独立的事实推翻了它——

**1. CN 加速在 A 下结构上不可能。** xim 的镜像表是挂在 **xpm 版本项**上的
（`url = { GLOBAL = ..., CN = ... }` + `sha256`）。架构 A 的版本项是 `{}`，
字节由 pnpm 在钩子里自己从 `codeload.github.com` 拉，**xim 全程看不见这个请求**，
没有任何东西可以贴 CN。全仓实测印证：走 npm 钩子的包（`openclaw`、`dsh`）
CN 条目 **0 条**，有 CN 镜像的（`claude`、`codex`）无一例外都有真实 url 资源。

硬凑也不成立：npm 源的只占 12%，且这些包本就不在 npm 上；git 源的可以用
`GIT_CONFIG_COUNT` 注入 `insteadOf` 重定向（不污染用户 git config），
但**重定向目标得先存在**——那就是 C 的镜像工作本身，只是换成 git 形态。

**2. xvm 需要一个可指的路径。** 初版写"xvm 在这里没有位置，因为插件不提供可执行文件"
——这是错的。xvm 的模型是 **name → 版本集 → active**，与是否可执行无关：
`glibc.lua` 用 `xvm.add(lib, { type = "lib" })` 注册 `libc.so` / `crt1.o`，
`musl.lua` 用 `xvm.add("musl", { type = "group" })` 注册一个不对应任何 artifact 的根节点
（全仓 `type = "lib"` 22 处、`type = "group"` 25 处）。

但 xvm 的切换**动作**是"重新指向一条路径"。A 的 payload 是空的，没有路径可指；
C 的 payload 就是切换对象。所以准确的说法是：
**xvm 不是对插件没用，是在 A 下没有着力点。**

**3. 上游会搬家、会删库**（§2.6）。在这种生态里"装过的东西还能再装一次"
不是优化，是索引存在的意义。

### 3.3.1 镜像资格：许可证门（D1a）

> **D1a：只有许可证明确允许再分发的包才进镜像。无 `LICENSE` 文件的包一律走 A，
> 不得镜像。判定写进 `discover.py`，不靠人工记忆。**

镜像 = 再分发。没有许可证文件意味着**默认保留所有权利**，索引没有分发权。
今天的实测分布（169 个 bundle，§2.7）：MIT 82 / BSD-3-Clause 42 / Apache-2.0 2 /
GPL-3.0 1 → 可镜像；**NONE 29 → 不可镜像**；NOASSERTION 13 → 需人工判读，
判读前按不可镜像处理（fail closed）。

GPL-3.0 那一个可以镜像：tarball 本身即源码，随附许可证即满足 copyleft。

副作用是好的：**无许可证的包本来就进不了镜像**，这给"收录门槛"提供了一条
非主观的判据，正好缓解"网站上四成是空壳"的担忧。

### 3.3.2 这让索引变成再分发方

C 把 `dsh-index` 从"索引"变成"再分发方"：127 个包的字节要放进 `xlings-res`。
这是**定位变化**，不只是工程量——附带许可证合规、内容责任、以及上游作者
要求下架时的响应义务。已获项目所有者确认接受。

镜像位组织：**一个 `xlings-res/dsh-plugins` 仓库，按 `<plugin>-<version>` tag 分版本**，
而不是 169 个独立仓库——后者会把 org 灌爆，且每加一个插件要建一个仓库。

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

        -- 该包 git 安装时是否会跑 prepare。走 C 时构建发生在索引 CI，
        -- 用户侧不需要授权；走 A 时用户必须 DSH_ALLOW_BUILDS=1。
        needs_build = false,

        -- 许可证。镜像资格的唯一判据（D1a），由 discover.py 写入，
        -- 不手填。空 / "NONE" / "NOASSERTION" 一律 fail closed 走 A。
        license = "MIT",

        -- ── 走 C 的包才有这一段：真实 xpm 资源，由镜像流水线回填 ──
        -- 有 mirror 段 = 架构 C（GLOBAL/CN + sha256 + xvm 版本切换）
        -- 无 mirror 段 = 架构 A（直连上游，无 CN，网站标注）
        mirror = {
            ["0.0.1"] = {
                tarball = "dsh-tool-csv-0.0.1.tgz",
                sha256  = "<pnpm pack 产物的 sha256>",
            },
        },

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

### 5.2 两种架构在描述符里怎么区分

**`dsh.mirror` 段存在与否，就是 C 与 A 的分界线**，不另设开关字段——
一个包的架构由"镜像里有没有它的字节"这个**事实**决定，而不是由一个可能与事实
不符的声明决定（R2：约定由写入方落实，读取方不猜）。

| | 走 C | 走 A |
|---|---|---|
| 描述符 | 有 `dsh.mirror` | 无 |
| `xpm` 版本项 | `{ url = {GLOBAL,CN}, sha256 }` 真资源 | `{}` 空 |
| `install()` | xlings 下载校验 tarball 进 payload | 空转 |
| `config()` | `dsh plugin add <payload>/<pkg>.tgz` | `dsh plugin add github:<origin>#<sha>` |
| `xvm.add` | `type = "group"`，支持 `xlings use` | 不注册 |

`sync.py` 负责保证一致性：**有 `mirror` 段却在镜像仓库里找不到对应 tag 的，
CI 必须 fail closed**，而不是悄悄降级成 A——那会让用户以为自己装的是可复现的字节。

---

## 6. index build 机制

### 6.1 `template.lua`

被 `pkgindex-build.lua` 追加到每个 `pkgs/**/*.lua` 尾部。它负责补齐
`package.type` / `package.xpm` 和四个 hook：

**一份模板要同时覆盖 C 和 A**，分支点只有一个：`package.dsh.mirror` 存不存在。

```lua
-- dsh-index 公共模板（由 pkgindex-build.lua 追加）

package.type = "config"        -- 插件是配置层，不产出可执行文件
package.archs = {"x86_64"}     -- 受限于 xim:pnpm，见 D2

local MIRROR   = package.dsh.mirror              -- 有 = 架构 C，无 = 架构 A
local RES_BASE = "dsh-plugins/releases/download" -- xlings-res 下的统一镜像位

-- xvm 只在 C 下有意义：A 的 payload 是空的，没有路径可指（§3.3 决策 2）
package.xvm_enable = MIRROR ~= nil

do
    local xpm = {}
    for _, p in ipairs({"linux", "macosx", "windows"}) do
        local t = { deps = {"xim:dsh", "xim:pnpm"},
                    ["latest"] = { ref = package.dsh.latest } }
        for v, _ in pairs(package.dsh.versions) do
            local m = MIRROR and MIRROR[v]
            if m then
                -- 架构 C：真实资源，GLOBAL/CN 双镜像 + 权威 sha256
                t[v] = {
                    url = {
                        GLOBAL = ("https://github.com/xlings-res/%s/%s-%s/%s")
                                 :format(RES_BASE, package.name, v, m.tarball),
                        CN     = ("https://gitcode.com/xlings-res/%s/%s-%s/%s")
                                 :format(RES_BASE, package.name, v, m.tarball),
                    },
                    sha256 = m.sha256,
                }
            else
                t[v] = {}   -- 架构 A：空资源，由 pnpm 直连上游取
            end
        end
        xpm[p] = t
    end
    package.xpm = xpm
end

import("xim.libxpkg.pkginfo")
import("xim.libxpkg.system")
import("xim.libxpkg.xvm")
import("xim.libxpkg.log")

local function profile()  return os.getenv("DSH_PROFILE") or "web" end
local function dsh_home() return os.getenv("DSH_HOME")
                                 or path.join(os.getenv("HOME") or os.getenv("USERPROFILE"), ".dsh") end
local function profile_manifest()
    return path.join(dsh_home(), "profiles", profile(), "package.json")
end

-- 递给 pnpm 的安装实参。C 指向 payload 里的 tarball（本地文件，
-- 上游删库也不影响，且不触发 pnpm 的 allowBuilds 门）；A 直连上游。
local function spec(version)
    if MIRROR and MIRROR[version] then
        return path.join(pkginfo.install_dir(), MIRROR[version].tarball)
    end
    if package.dsh.source == "npm" then
        return package.dsh.origin .. "@" .. version
    end
    return "github:" .. package.dsh.origin .. "#" .. package.dsh.versions[version].ref
end

-- D4：真相在 profile 的 package.json 里，不在 xim 的标记里
function installed()
    local f = io.open(profile_manifest(), "r")
    if not f then return false end
    local body = f:read("*a"); f:close()
    return body:find(package.dsh.bundle_name, 1, true) ~= nil
end

function install()
    if not MIRROR then
        return true          -- 架构 A：无 payload，取包在 config() 里由 pnpm 完成
    end
    -- 架构 C：xlings 已把 tarball 下载并按 sha256 校验好，搬进 install_dir
    local tgz = MIRROR[pkginfo.version()].tarball
    os.tryrm(pkginfo.install_dir())
    os.mkdir(pkginfo.install_dir())
    os.mv(pkginfo.install_file(), path.join(pkginfo.install_dir(), tgz))
    return os.isfile(path.join(pkginfo.install_dir(), tgz))   -- R4：断言产物
end

function config()
    -- D5：只有走 A 且带 prepare 的包，才会在用户机器上执行上游代码。
    -- 走 C 的包构建已经在索引 CI 里完成，用户装的是 tarball，无需授权。
    if (not MIRROR) and package.dsh.needs_build
       and os.getenv("DSH_ALLOW_BUILDS") ~= "1" then
        log.error(("%s 未进镜像（license: %s），只能从 git 直装，"
               .. "而它带 prepare 构建脚本。\n"
               .. "这是在你的机器上执行该包代码的授权，且不在 agent 的沙箱内。\n"
               .. "确认信任后用 DSH_ALLOW_BUILDS=1 重新安装。")
               :format(package.name, package.dsh.license or "unknown"))
        return false
    end

    system.exec(("dsh plugin --profile %s add %s")
                :format(profile(), spec(pkginfo.version())))
    if not installed() then
        return false        -- R4：断言 profile 清单真的收下了
    end

    -- 只有 C 注册 xvm。type = "group"：这个名字不对应任何可执行文件，
    -- 留成默认 program 类型会生成一个永远失败的 shim（openxlings/xlings#452）。
    if MIRROR then
        xvm.add(package.name, { type = "group" })
    end
    return true
end

function uninstall()
    if MIRROR then
        xvm.remove(package.name)
    end
    system.exec(("dsh plugin --profile %s remove %s")
                :format(profile(), package.dsh.bundle_name))
    return true
end
```

> ⚠️ **`xvm use <plugin> <ver>` 之后 profile 不会自动跟着动。**
> xvm 的切换是"重指路径"，而 pnpm 已经把 tarball 内容**拷贝**进了
> `profiles/<p>/node_modules`——它不是符号链接，不会感知 xvm 的切换。
> 所以切换动作大概率还要跟一次 `dsh plugin add <新版本 tarball>`。
> 这条**必须实测**再定形，不能照着 glibc 的 lib 切换想当然（§13 未决 3）。

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

### 7.4 `mirror.py` — 镜像流水线（架构 C 的那一半）

只对**许可证允许再分发**的包运行（D1a）。对每个 `(plugin, version)`：

1. `git clone --depth 1` 到 pin 的 40 位 sha，**核对 sha 与描述符一致**；
2. 核对仓库根有 `LICENSE` 且 SPDX 与描述符 `dsh.license` 一致——
   **上游改许可证要能被发现**，不是一次判定终身有效；
3. `pnpm install --frozen-lockfile` + 跑该包自己的 `prepare`（38 个包需要）——
   **这一步就是把"在用户机器上执行上游代码"搬进索引 CI 的地方**；
4. `pnpm pack` → `<name>-<version>.tgz`；
5. 校验 tarball 里确实有 `package.json#dsh.bundle` 指向的 patch 文件，
   以及 `main` 指向的产物真的存在（TS 包没构建就 pack 是最常见的坏产物）；
6. 发布到 `xlings-res/dsh-plugins`，tag `<plugin>-<version>`，
   **GitHub RES 与 GitCode RES 同 tag 同文件**，各带 `.sha256` sidecar；
7. 从两侧各下载一次 + 与本地产物逐字节比对，一致才回填描述符的
   `dsh.mirror[v] = { tarball, sha256 }`。

失败的任何一步都**不回填** `mirror` 段——那个包就留在架构 A，网站上照实标注。
这是 fail closed：宁可显示"无 CN 加速"，也不要一个指向不存在资源的版本项。

> 沿用 xim-pkgindex 的 `xlings-res` 纪律（见其 `docs/contributing.md` §3）：
> 双镜像同 tag、sidecar 齐全、三方下载比对，缺一不发。

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
| **镜像 / 直连徽标** | `dsh.mirror` 是否存在 | **用户有权知道自己装的是不是可复现的字节**，以及有没有 CN 加速 |
| 许可证 | `dsh.license` | 徽标为什么是"直连"的解释就在这里（无 license = 不能镜像） |
| bundle / library | `dsh.bundle` 是否存在 | library 装了不激活任何层，用户要能一眼看出 |
| 上游仓库 + pin 的 sha | `dsh.versions[v].ref` | 可审计：装的到底是哪次提交 |
| `needs_build` 徽标 | `dsh.needs_build` && 无 `mirror` | 只有"直连 + 带 prepare"才需要用户授权代码执行（D5） |
| 目标 profile | `DSH_PROFILE` 缺省值 | 安装命令要能直接抄走 |
| 兼容状态 | awesome-dsh-plugins 引用 | 生态里唯一在跑的兼容情报 |

镜像徽标不是装饰。今天 169 个包里有 42 个（29 无 license + 13 待核）**永远装不回来**
——上游一删就没了。把这件事藏起来，用户会以为索引给了他不存在的保证。

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
| 安装期任意代码执行 | 38 个包的 `prepare` | 走 C 的：构建在索引 CI 完成，用户侧零授权。走 A 的：D5 `DSH_ALLOW_BUILDS=1` 显式授权 + 网站徽标 |
| **42 个包永远装不回来** | 29 无 license + 13 待核，不能镜像 | 网站明示"直连上游"，并向作者提 issue 请补 license（§12 第三期） |
| 上游改许可证 | 一次判定终身有效是错的 | `mirror.py` 每次跑都重新核对 SPDX（§7.4 步骤 2） |
| 镜像与描述符不一致 | `mirror` 段有、镜像仓库没有 | CI fail closed，不静默降级成 A（§5.2） |
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

C 和 A 共用同一份 `template.lua`，分支只有 `dsh.mirror` 一个判断，
所以**两条路线不需要分期做完再做另一条**——第一期就把两条都跑通，
只是收录的包少。

**第一期（两条路线各跑通一个包）**
1. `pkgindex-build.lua` + `template.lua` + 沙箱 harness + build-sanity CI
2. 手工收录 2 个包：一个 MIT（走 C，含镜像发布）、一个无 license（走 A），
   两条路径的 add / dump-config / remove 全链都实测
3. 建 `xlings-res/dsh-plugins` 镜像仓库 + `mirror.py` 最小实现
4. `.xpkgindex.json` + `dsh.py`（含镜像/直连徽标）+ Pages 部署
5. README：`xim --add-indexrepo dsh:https://github.com/Sunrisepeak/dsh-index.git`
6. **实测未决 1~3**（见 §13），把结论写回本文档

**第二期（自动化 + 扩量）**
7. `discover.py` + `catalog.json`（R1 总账，双源并集，repo id 检测 move）
8. `mirror.py` 全量跑一遍 127 个可镜像包
9. `sync.py` + 定时 PR workflow
10. L3/L4 抽样安装测试进 CI

**第三期（加固）**
11. NOASSERTION 那 13 个逐个人工判读，能镜像的转 C
12. 向 `openxlings/xlings` 提 PR，把 `dsh` 加进 `xim-indexrepos.lua` 成为一等索引
13. aarch64：推动 `xim:pnpm` 补 arm64 资产
14. 向无 license 的 29 个包的作者提 issue，请其补许可证——
    **这是把 A 转成 C 唯一的正路**，比任何技术手段都有效

---

## 13. 未决问题

1. **`type` 取值**：插件是配置层，`type = "config"` 语义最近，但 xim 的 `config` 类型
   原本指"写用户工具配置的包"。是否需要给索引引入新 type，需要和 xlings 侧确认。
2. **`system.exec` 在 hook 里调 `dsh`**：`dsh` 是同一次安装里刚由 `xim:dsh` 装的，
   config() 期它是否已在 PATH 上、还是要从 payload 解析（R6：内部消费者绑 payload
   而不是 view），需要实测确认。
   > 参考 `xim:dsh` 自己的解法（xim-pkgindex#618）：它用
   > `pkginfo.dep_install_dir("xim:node")` 拿到 node payload 再 exec，
   > 本索引很可能要照抄这个形状去拿 `xim:dsh` 的 payload。
3. **`xvm use <plugin> <ver>` 之后 profile 到底跟不跟**：pnpm 把 tarball 内容
   **拷贝**进 `node_modules`（不是符号链接），所以 xvm 重指路径很可能不被感知，
   切换动作还要跟一次 `dsh plugin add`。**必须实测**，不能照 glibc 的 lib 切换类推。
   如果实测证明 xvm 在这里做不出真正的切换，那 `xvm.add` 就只剩"版本记账"价值，
   要么保留并说明，要么去掉——不能留一个看起来能切、实际不切的东西。
4. **`os.getenv` 在 hook runtime 的可用性**：`DSH_PROFILE` / `DSH_HOME` / `DSH_ALLOW_BUILDS`
   三个读取点都依赖它，落地前必须实测（xpkg-creater skill 已记录多个"hook runtime
   里没绑定的东西会静默毁掉安装"的先例）。
5. **收录门槛**：catalog 全量记账（R1），`pkgs/` 收录设门槛。
   许可证门（D1a）已经天然筛掉一批；是否再叠 star / 兼容性门槛待定。
   注意长尾很集中——`omdsh-dev` 一家占 51 个仓库，无门槛全收等于让一个作者
   占据网站四分之一。
6. **上游要求下架怎么办**：C 让本索引成为再分发方，需要一条明确的 takedown 流程
   （删 tag → 描述符退回 A → 网站徽标翻转），并写进 README。
