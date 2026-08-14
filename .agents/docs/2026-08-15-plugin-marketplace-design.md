# dsh 插件市场设计方案：Web + TUI + Agent 工具接口

> 编写日期：2026-08-15
> 前置：`2026-08-13-dsh-plugin-index-design.md`（分发架构）、`2026-08-14-agent-distribution-design.md`（三层模型）
> 调研环境：本机 `dsh 0.1.0-rc.6`（`~/.xlings/data/xpkgs/xim-x-dsh/0.1.0-rc.6`），`dsh-cc-tui 0.1.6`
> 一句话：**dsh 官方已经有一个只读的"装了什么"，缺的正好是"有什么 + 装上它"** —— 市场不是新概念，是把官方自己写在 README 里的空缺补完。

---

## 0. 一句话结论

| 面 | 结论 | 可行性 |
|---|---|---|
| **数据源** | 索引已经在发 `index.json` / `packages.json` / `search-index.json`，**不需要任何后端** | ✅ 已验证 |
| **Web** | 官方 `settings.plugins.tab` 槽位，紧挨着只读的"插件列表"加一个"市场"页 | ✅ 官方支持的扩展点 |
| **TUI** | `ctx.commands.register()` → `/market`，**cc-tui 已经会合并插件注册的命令** | ✅ 已验证，零上游改动 |
| **Agent 工具** | `ctx.tools.register()` 注册 5 个工具，装之前过 `ctx.approval` | ✅ 官方 API |
| **贡献回仓库** | 把 `.agents/skills/` 两个 skill 打进包，注册到 `ctx.skills` | ✅ cc-tui 已有先例 |
| **最大的坑** | 装完的插件**不会热加载**，必须重启 profile | ⚠️ 必须诚实说出来 |

---

## 1. 调研：dsh 插件到底怎么写

### 1.1 一个插件 = 一个 npm 包 + 一份 cordis patch

```json
{
  "name": "dsh-index-market",
  "dsh": { "bundle": { "patch": "./cordis.patch.yml" } },
  "peerDependencies": {
    "@deepseek-ai/cordis": "^4.0.1",
    "@deepseek-ai/dsh-invariants": "^0.1.0-rc.6"
  }
}
```

`cordis.patch.yml` 贡献**一层配置补丁**：按 row `id` 覆盖已有行，或 `insert:` 新行。profile 按 `dsh.profile.bundles` 的顺序叠这些补丁，后层覆盖前层，`config` 是整体替换而不是深合并。

> `peerDependencies` 这一条是有血的教训：`dsh-turn-rewind` 把 `cordis` 只写在 peerDependency 里，而 dsh 给它 scaffold 的 profile 带着 `autoInstallPeers: false`，于是 `agent-web-coding` 装完一切正常、dump 出六层干净配置，一启动 `ERR_MODULE_NOT_FOUND`。`tools/bootcheck.py` 就是为这个写的。

### 1.2 官方已经有一个"插件列表"，而且明说了它不做什么

| 包 | 是什么 |
|---|---|
| `@deepseek-ai/dsh-host-plugin-inventory` | 注册 `pluginInventory` 服务 + 一个 Remote `pluginInventory/list`，读 `ctx.loader.entries()` |
| `@deepseek-ai/dsh-client-ui-settings-plugin-inventory` | Web Settings 里的只读"插件列表"页，槽位 id `all` |

它自己的 README 写着：

> **No provenance or mutation** — the service does not identify which bundle, profile, or override introduced an entry, and it **cannot enable, disable, add, or remove plugins**.
> **Point-in-time state only** — the result contains no durable failure history or subscription.

**这就是市场的位置**：

```
pluginInventory  →  这个进程现在跑着哪些 row（只读、无来源、无法变更）
market           →  索引里有哪些包 + 它从哪来 + 把它装上
```

不发明概念，补完一个官方自己标注了边界的能力。

### 1.3 可用的扩展点（全部实测确认）

| 扩展点 | API | 用途 | 证据 |
|---|---|---|---|
| **UI 槽位** | `ctx.slots.inject()` / `register({name, ...}, Component)` | 往 `settings.plugins.tab` 塞一页 | `dsh-client-ui-slots` README；inventory 页就是这么注册 id `all` 的 |
| **人类命令** | `ctx.commands.register(definition)` | `/market …`，被所有命令适配器消费 | `dsh-commands` README |
| **模型工具** | `ctx.tools.register(definition)` | Agent 可调用的工具 | `dsh-tools` README |
| **技能** | `ctx.skills.registerProvider(...)` | 打包 skill 随插件分发 | `dsh-skill` / `dsh-skill-filesystem` |
| **授权** | `ctx.approval.request(req)` | 装之前问人；**缺答复者时 fail closed** | `dsh-user-approval` README |
| **子进程** | `ctx.subprocess` | 调 `xlings` / `dsh plugin` | `dsh-subprocess` / `dsh-subprocess-local` |
| **RPC** | Typert + `ctx.remote.*`（经 `dsh-api-remotes` facade） | 主机服务给浏览器半边用 | `dsh-typert-protocol` / `dsh-api-remotes` |
| **作用域** | `dsh-scope` | 全局层 vs agent 层，就近覆盖 | `dsh-tools` / `dsh-skill` 都是这个形状 |

`ctx.tools.register()` 的确切语义（README 原文）：

> The layer is the calling context's scope: a plain plugin context registers globally; an agent's `agent.ctx` registers for that agent alone, shadowing a same-named global tool there.

### 1.4 TUI 侧的关键发现

官方**没有** TUI（只有 Web 和 headless）。终端面由第三方 `dsh-cc-tui` 补位，它是索引里的一个包。

翻它的 `lib/types/commands.d.ts`：

> Claude Code's command system is deeply wired into its engine; cc-tui ships a small built-in set with the same `/name — description` suggestion chrome, and **merges plugin-registered commands (plan/goal/…) from the DSH command registry (`dsh-commands`)** — `runCommand` in the Chat screen dispatches either kind, with the registry handler winning for names both sides declare.

**所以任何插件只要 `ctx.commands.register({name: 'market'})`，`/market` 就自动出现在 cc-tui 的 `/` 菜单里，并且注册表的 handler 优先。** 零上游改动，而且换成任何未来的命令适配器（官方 TUI、ACP 桥）都照样能用。

这一条决定了 TUI 方案的形状：**不写 cc-tui 的私有代码，写命令**。

### 1.5 已经存在的"自引用"先例

`@deepseek-ai/dsh-tool-cordis` 提供 5 个模型可调用的工具，直接操作当前进程的 cordis 运行时：`cordis_inspect`（服务、活的 fiber、已注册工具、client 槽位面）、`cordis_define`（登记一个动态包，用户在对话里看到卡片和启动控件）。

意义：**"让 Agent 去改自己的运行时"在 dsh 里已经是一等公民，且已经建立了"模型提议 → 用户在 UI 上确认 → 才生效"的交互范式。** 市场的 `market_install` 应该照抄这个范式，而不是自创。

---

## 2. 数据源：索引已经在发了

`python3 -m xpkgindex generate . --output site` 产出的静态站点里有三份机器可读文件（本机实测）：

| 文件 | 形状 | 行数 |
|---|---|---|
| `site/packages.json` | `[{name, description, homepage, repo, licenses, type, status, latest_version, all_versions, deps, install_command}]` | 71 |
| `site/search-index.json` | `[{s, d, n, ns, t, f:{tier, delivery, category, keyword, namespace}, v}]` | 71 |
| `site/index.json` | `{schema:1, site, index, stats, facets, growth, history, guides, packages}` | 1 |

实样：

```json
{"s":"agent-tui-coding","n":"agent-tui-coding","ns":"dsh",
 "t":"A terminal coding Agent: …",
 "f":{"tier":"agent","delivery":"direct","category":"","keyword":"agent profile","namespace":"dsh"},
 "v":"0.1.0"}
```

`f.tier` = plugin/group/agent，`f.delivery` = mirrored/direct —— 这正是市场卡片上最该先说的两件事，站点插件（`.xpkgindex/plugins/dsh.py`）已经把 delivery 定为第一个 facet，理由写在它的 docstring 里：

> That split is not a preference, it is the license: mirroring is redistribution. […] Hence the badge is the first facet, not a footnote.

**结论：市场不需要后端，也不需要新格式。** 消费 `https://sunrisepeak.github.io/dsh-index/` 下这三份文件即可。`schema: 1` 是版本锚点，遇到不认识的 schema 就 fail closed。

### 2.1 "自带一份市场"怎么落地

用户的要求是从 dsh-index 装下来的 Agent / 插件**自带**一份市场。做法：

```
构建期：把当天的 packages.json + search-index.json 打进 npm 包（snapshot/）
运行期：带 ETag 去站点刷新 → 成功则用新的，失败则用快照并在 UI 上说"离线快照 · 2026-08-15"
```

理由和索引镜像 tarball 是同一个：**CN 网络下 github.io 不可靠**。快照让市场在完全离线时仍能浏览（只是装不了未镜像的包）。刷新地址同时给两个：站点 + xlings-res 镜像，镜像优先。

快照的新鲜度上限 = 这个包自己的版本。所以市场包应该跟着索引的节奏发版（每次 discover 合并后发一个 patch），这一步可以由索引仓库的 release workflow 触发。

---

## 3. 架构

```
                 ┌─────────────────────────────────────────┐
                 │  dsh-index 站点 (静态 JSON) + xlings-res │
                 └───────────────┬─────────────────────────┘
                                 │ ETag 刷新，失败回落内置快照
┌────────────────────────────────▼─────────────────────────────────┐
│ dsh-index-market  (一个 npm 包 = 一个 bundle)                     │
│                                                                  │
│  host 半边                                                        │
│    ctx.market            catalog / search / show / installed      │
│                          install / remove / refresh               │
│    ├─ 读 pluginInventory.list()   ← 官方只读服务，做"已装"对账      │
│    ├─ ctx.approval.request()      ← 变更前必过，fail closed        │
│    └─ ctx.subprocess              ← xlings install / dsh plugin add│
│                                                                  │
│  三个消费面（互不依赖，可分期）                                     │
│    ① ctx.tools.register()    → 5 个 Agent 工具                    │
│    ② ctx.commands.register() → /market  （TUI + 任何命令适配器）   │
│    ③ ctx.slots.inject()      → Web Settings ▸ 插件 ▸ 市场         │
│                                 (经 Typert Remote 调 ctx.market)  │
│                                                                  │
│  ctx.skills.registerProvider() → 打包 pr-workflow / xpkg-creater  │
└──────────────────────────────────────────────────────────────────┘
```

**一个包，三个面，一个主机服务。** 三个面都只调 `ctx.market`，任何一个面单独砍掉其余两个照常工作 —— 这是分期的前提。

### 3.1 `ctx.market` 服务契约

| 方法 | 说明 |
|---|---|
| `refresh()` | 拉站点/镜像，ETag 比对；返回 `{source: 'site'\|'mirror'\|'snapshot', at}` |
| `search(q, {tier, delivery, category})` | 本地全文 + facet 过滤，直接跑在 `search-index.json` 上 |
| `show(name)` | 全量信息：版本列表、pin 的 commit、license、镜像状态、deps、两条安装命令 |
| `installed(profile?)` | 读 profile 的 `package.json` `dsh.profile.bundles`，**join** `pluginInventory.list()` 拿到活的 fiber 状态（pending/loading/active/failed/unloading） |
| `install(name, {profile, version})` | 见 §3.2 |
| `remove(name, {profile})` | `dsh plugin --profile p remove <bundle>`；注意匹配的是 **bundle 名**不是描述符名（描述符里 `bundle_name` 与 `name` 经常不同，如 `dsh-annotation` → `@omdsh-dev/dsh-annotation`） |

`installed()` 那个 join 是市场比官方只读列表多出来的东西：官方列表能告诉你 row `x` 是 `active`，但它明说了"不识别是哪个 bundle / profile / override 引入了这个 row"。市场有描述符，能补上来源。

### 3.2 install 的两条路径

```
if xlings 存在:
    xlings install dsh:<name>[@<version>]      ← 镜像加速 + sha256 校验 + 自动写 profile
else:
    dsh plugin --profile <p> add <spec>         ← spec 来自描述符：镜像 tarball URL 或 github:owner/repo#<sha>
```

**UI 必须显示走的是哪条。** 第二条丢掉了镜像加速和 sha256 校验 —— 那是这个索引存在的两个理由之一，静默降级等于静默取消承诺。

### 3.3 授权：不可协商

`install` 是**代码执行**：70 个描述符里 13 个 `needs_build = true`，装它们会跑 npm `prepare` 脚本。v1 设计 §3.7 已经定过调子（"构建脚本 = 代码执行，必须显式授权"）。

- 每次变更前 `ctx.approval.request(...)`。该服务的语义是"missing or failing answerers **fail closed**"，正合适。
- `needs_build = true` 的包用**不同的、更响的**确认文案，把"会在你机器上跑构建脚本"说出来。
- `delivery: direct`（未镜像）的包也要单独提示：字节来自 GitHub，没有 sha256 承诺。

### 3.4 最大的坑：装完不会热加载

`dsh plugin add` 改的是 profile 目录里的 `package.json` + `node_modules`。**运行中的 Loader 树不会捡起新 row。** （`dsh-client-hmr` 只管 client bundle 的重载，不是这件事。）

所以 `install` 的返回必须是：

```
✅ dsh-mnemon@0.1.0 已装入 profile `web`（镜像 · sha256 已校验）
⟳ 重启后生效：dsh --profile web
```

**绝对不能说"已启用"。** 一个在这件事上撒谎的市场比没有市场更糟 —— 用户会以为插件在跑，然后花半小时 debug 一个根本没加载的东西。

TUI 侧可以更进一步：命令执行完提供一个"现在重启"的选项（cc-tui 本来就在插件卸载时 dispose 整棵树退出进程）。Web 侧做不到自重启，只能显示提示。

---

## 4. Web 面

### 4.1 挂在哪

`@deepseek-ai/dsh-client-ui-settings-plugins` 拥有 **Plugins** section 和它的 tab chrome，README 原文：

> The section owns the heading and compact tab chrome; feature plugins contribute pages through `settings.plugins.tab`.

而只读的库存页就是往这个槽注册 id `all`，并且它的 README 说明了为什么用 `inject()`：

> The registration uses `ctx.slots.inject()`, so it follows late tab declaration, redeclaration, locale changes, and teardown **without importing the section owner**.

→ 市场注册 `settings.plugins.tab` 的 id `market`。用户路径：

```
Settings ▸ 插件 ▸ [插件配置] [插件列表] [市场]
                    官方        官方(只读)   我们
```

**信息架构上这是唯一正确的位置**：不新开一级导航，用户找"插件"的地方就是插件的一切。

### 4.2 页面

沿用邻居那一页的 chrome（可搜索的两列 disclosure 卡片），保持视觉一致：

- 顶部：搜索框 + facet chips（`tier: agent/group/plugin`、`delivery: mirrored/direct`、`category`）
- 卡片折叠态：包名 · tier 标签 · **delivery 徽章** · 已装状态点
- 卡片展开态：描述、license、pin 的 commit（短 sha）、版本下拉、deps、两条安装命令、`[安装到 profile ▾]`
- 右上角：`快照 2026-08-15 · [刷新]`，离线时明写"离线"
- 状态：loading / empty / no-match / 失败可重试，全部本地态，不暴露传输层细节（照抄邻居页的做法）

### 4.3 RPC

浏览器半边不能直接调主机服务。照 `pluginInventory` 的形状走 Typert：主机注册 Remote，客户端经 `@deepseek-ai/dsh-api-remotes` 这个 facade 拿到 `ctx.remote.market.*`。README 明确要求：

> Client packages consume it through the explicit `api-remotes` assembly rather than importing the Host implementation.

---

## 5. TUI 面

### 5.1 A 档：命令（今天就能用，零上游改动）

`ctx.commands.register({ name: 'market', description: '浏览 / 安装 dsh-index 插件', handler })`，cc-tui 自动合并进 `/` 菜单（§1.4 已验证）。

```
/market                      → 概览：71 个包 · 67 镜像 · 分 tier 计数 · 快照日期
/market search 记忆          → markdown 表格（cc-tui 原生渲染表格 + 代码高亮）
/market show dsh-mnemon      → 详情卡：版本 / commit / license / 镜像 / deps / 安装命令
/market install dsh-mnemon   → ctx.approval 走 cc-tui 已有的确认 UI → 装 → 打印重启行
/market installed            → 本 profile 已装 + 活的 fiber 状态
```

命令返回文本，cc-tui 已有 markdown 表格与代码高亮的渲染能力，够用。

**为什么这是正确的 TUI 方案而不是妥协**：`ctx.commands` 是官方的、面向所有命令适配器的注册表。写它，市场在 cc-tui、未来的官方 TUI、ACP 桥里全部可用；写 cc-tui 的内部结构，只在 cc-tui 里可用，还会随它重构而碎。

### 5.2 B 档：全屏浏览面板（需要上游）

想要"上下键选包、Enter 装"的全屏交互，需要 TUI 侧有槽位契约。**今天没有** —— `dsh-client-ui-slots` 是 Web（React DOM）那侧的东西，cc-tui 没有对外的面板注册点。

路径：给 `ccch1mneyyy/DSH-TUI` 提一个 `tui.panel` 贡献点的提案（它是索引里的包，是同生态伙伴，沟通成本低）。

**但要说清楚：这是一个我们不控制的第三方依赖，B 档不该进任何有承诺的排期。** A 档就是 TUI 的完整故事，B 档是锦上添花。

---

## 6. Agent 工具接口

`ctx.tools.register()`，五个：

| 工具 | 入参 | 出参 | 授权 |
|---|---|---|---|
| `market_search` | `query`, `tier?`, `delivery?`, `category?` | 命中行（名/描述/tier/镜像/版本） | 无 |
| `market_show` | `name` | 全量详情 + 两条安装命令 | 无 |
| `market_installed` | `profile?` | 已装 + 活的 fiber 状态 | 无 |
| `market_install` | `name`, `profile?`, `version?` | 安装结果 + **重启提示** | **`ctx.approval`** |
| `market_contribute` | `kind`, `repo_url` \| `agent_spec` | 生成的描述符 / PR 草稿 | **`ctx.approval`** |

于是用户可以直接对 Agent 说：

> "帮我找个本地记忆的插件装上"
> → `market_search("memory")` → `market_show("dsh-mnemon")` → 报告 license/镜像/是否需要构建 → 用户点确认 → `market_install` → "装好了，重启 `dsh --profile web` 生效"

**注册层次**：挂在 agent 的 ctx 下 → agent 作用域；挂在插件 ctx 下 → 全局。默认全局（市场不是某个 agent 私有的能力），但保留配置项。

**呈现形式**不用管：`dsh-tools` 的 `mode` config 自己决定 native function calling 还是 Code Mode，我们只交 schema。

---

## 7. 贡献回仓库

用户明确要的一环："以及 dsh-index 相关的操作（贡献到仓库的 skill 等等）"。

### 7.1 把 skill 打进包

仓库已经有两个写好的 skill，frontmatter 规范：

| skill | 覆盖 |
|---|---|
| `.agents/skills/pr-workflow` | 所有变更必须走 PR + CI，禁止直推 main |
| `.agents/skills/xpkg-creater` | 三层模型、描述符字段规范、两个 Lua 运行时的陷阱、隔离约束、沙箱回归门、验收流程 |

打进 npm 包的 `skills/` 目录，注册到 `ctx.skills`。**先例现成**：`dsh-cc-tui` 自己就带了 7 个 skill（audit / bug / practice / pr-comments / release-notes / review / vuln-check）。

效果：**任何从 dsh-index 装过东西的 Agent，自动就知道怎么给 dsh-index 写描述符、怎么开一个合规的 PR。**

### 7.2 `market_contribute`

复用索引自己的规则（`tools/sync.py` + `tools/discover.py` 的判据，JS 侧重新实现同一套）：

1. 先 pin，**再在 pin 上读** package.json —— 顺序反了就会出现"版本号描述的不是这个 commit 的字节"（索引曾经 169 个里错了 19 个）
2. 必须声明 `dsh.bundle`（topic 本身不构成证据：281 个带 topic 的仓库里只有 169 个真的声明了）
3. ≥2 star、非 archived
4. 名字归一化 + 冲突检测
5. **`mirror` 块一律不写** —— fail-closed，镜像资格是 license 问题，由 `tools/mirror.py` 事后回答

产出：一个描述符文件 + 一个符合 `pr-workflow` 的 PR 草稿。**不自动 push**，交给用户/Agent 在授权后执行。

---

## 8. 打包与分发

### 8.1 代码放哪：独立仓库

**建议 `Sunrisepeak/dsh-index-market` 独立仓库**，由 dsh-index 以普通插件描述符收录。

理由：dsh-index 是**数据仓库**，它自己的 CI 契约就是"描述符只写数据、不写 hook"（`test_data_only` 在强制这一点，生命周期由 `template.lua` 在构建期统一追加）。把一个 TypeScript 应用 vendored 进去会破坏它自己的模型。

代价：跨仓库发版协同。缓解：索引侧的 release workflow 在 discover 合并后触发市场仓库刷新快照并发 patch 版本。

### 8.2 怎么到用户手上

```lua
-- tools/agents.json
{ "name": "agent-web-coding", ..., "extra": ["dsh-index-market"] }
{ "name": "agent-tui-coding", ..., "extra": ["dsh-index-market"] }
```

于是**从这个索引装的每个 Agent 都自带市场**，正是用户要的"自带一份 dsh-index 插件市场"。单独想要的人也能 `xlings install dsh:dsh-index-market`。

### 8.3 自举

市场本身是它所浏览的索引里的一个包。好性质：它把每条规则都在自己身上跑一遍 —— 有描述符、要过 `bootcheck`、要走 mirror 门、在自己的市场页里能被搜到。

---

## 9. 分期

| 期 | 内容 | 依赖 | 产出 |
|---|---|---|---|
| **P0** | 快照 + `ctx.market` 主机服务 + 5 个 Agent 工具 + `/market` 命令 | 无 | **TUI 与 Agent 两条路第一天就通**，零 UI 代码 |
| **P1** | Web `settings.plugins.tab` 市场页 + Typert Remote | P0 | 三个面齐 |
| **P2** | skill 打包 + `market_contribute` | P0 | 浏览 → 安装 → 贡献 闭环 |
| **P3** | 向 cc-tui 提 `tui.panel` 槽位提案 | 第三方 | 全屏 TUI 浏览（不做承诺） |

**P0 不写一行 UI 代码就能交付完整可用的市场**，这是这个分期最重要的性质：先证明数据和服务是对的，再谈界面。

---

## 10. 风险与取舍

| 风险 | 处理 |
|---|---|
| **装完不热加载** | UI/工具返回里明写"重启生效"，绝不说"已启用"（§3.4） |
| **没有 xlings 时降级** | 回落 `dsh plugin add` + pinned commit，**显示走的是哪条路径**，丢镜像和 sha256 要说出来 |
| **装 = 代码执行** | 强制 `ctx.approval`；`needs_build = true` 用更响的文案 |
| **快照过期** | 卡片常驻显示快照日期与来源（site / mirror / snapshot） |
| **catalog schema 变** | `index.json` 有 `schema: 1`，pin 住，遇到未知 schema fail closed |
| **cc-tui 是第三方** | A 档只依赖官方 `ctx.commands`，cc-tui 换掉也不受影响；B 档明确标为不承诺 |
| **`remove` 匹配错对象** | `dsh plugin remove` 匹配 **bundle 名**（如 `@omdsh-dev/dsh-annotation`），不是描述符名（`dsh-annotation`）；描述符里两者经常不同 |
| **跨仓库发版脱节** | 索引 release workflow 触发市场快照刷新 |

---

## 11. 未决（需要你拍板）

1. **仓库位置**：独立仓库（§8.1，我的建议）vs 放进 dsh-index 的 `market/` 子目录？后者省协同，代价是破坏"描述符只写数据"的仓库模型。
2. **默认捆绑**：市场要不要默认进两个 Agent 的 `extra`？装 Agent 的人是否都想要一个市场？（我倾向要 —— 这正是用户描述的"自带"。）
3. **`/market install` 之后要不要提供"现在重启"**：TUI 能做（cc-tui 卸载即退出进程），Web 做不到。要不要接受两个面行为不一致？
4. **写权限边界**：`market_install` 允许 Agent 在批准后自己装插件。要不要再加一道"只允许装 `delivery: mirrored` 的包"的默认策略，把未镜像包留给人手动装？
5. **P3 是否要主动推**：给 cc-tui 提 TUI 槽位提案的优先级 —— 现在提，还是等 A 档跑一段时间收集到真实需求再提？
