---
name: xpkg-creater
description: 在 dsh-index 中定义 Agent、插件组与插件的 xpkg 包。三层模型（plugin / group / profile），组合用 xpkg 自己的 deps，描述符只写数据、不写 hook——生命周期由 template.lua 在索引构建期统一追加。覆盖字段规范、两个 Lua 运行时的陷阱、隔离约束、构建沙箱回归门与验收流程。
---

# xpkg-creater（dsh-index 版）

这个索引分发的主体是 **Agent**：

```
Agent = Harness + Plugins        →  dsh 模型里就是一个 profile
```

所以本 skill 的顺序是**先讲怎么定义一个 Agent**，再讲它的原料。
写一个包在这里 = **写一份数据描述符**，不是写 hook：`type` / `xpm` / 四个
lifecycle hook 全部来自 `template.lua`，由 `pkgindex-build.lua` 在索引构建期
追加到每个 `pkgs/**/*.lua` 尾部。一套范式，一份实现。

命名空间固定为 **`dsh`**：

```bash
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git
xlings install dsh:<name> -y
```

> 完整命令与链接见 `references/xlings-setup-and-links.md`
> 验收流程见 `references/testing-and-acceptance.md`
> 设计依据见 `.agents/docs/2026-08-14-agent-distribution-design.md`

---

## 0) 三层模型

| `dsh.kind` | 是什么 | payload | 安装它会发生什么 |
|---|---|---|---|
| `plugin` | 一个上游 bundle，原子 | 镜像 tarball（有许可证时）或无 | 取字节并 pin 住，**不进任何 profile**，打印出组合它的那一行 |
| `group` | 可干净共存的可复用组合 | 无 | `deps` 把成员取齐 |
| `profile` | **一个完整 Agent** | 无 | 建它的 profile、把成员组合进去、注册一个以包名命名的命令 |

`kind` 放在 `dsh.*` 而**不是** xpkg 的 `type`：`type` 是封闭枚举，libxpkg 的
`parse_type()` 对未知字符串静默返回 `Package`，所以 `type = "dsh-agent"`
不会报错，它会**蒸发**。

**取字节和做组合是两件事、两个主人。** 插件曾经自己注册进 profile，结果装一个
Agent 会连带把它的五个成员塞进 `web` —— 每个成员在 Agent 运行之前就已经替自己
决定了归属。而 xlings 装依赖是递归调用 CmdProcessor，被装的包拿不到"谁请求了
我"（`_RUNTIME` 只有自身的 name/version/dirs/deps），所以"直装时注册、被引用时
不注册"表达不出来。于是：**原子只取，组合由 Agent 或用户做**。

---

## 1) 定义一个 Agent（最常见的贡献）

Agent 和 group 是**生成的**。改 `tools/agents.json`，不要手改描述符 ——
CI 会重跑展开，手改会被认定为漂移。

```jsonc
{
  "groups": [
    { "name": "group-web-essentials", "version": "0.1.0",
      "description": { "en": "…", "zh": "…" },
      "members": ["dsh-at-file", "dsh-annotation"] }
  ],
  "agents": [
    { "name": "agent-web-coding", "version": "0.1.0",
      "description": { "en": "…", "zh": "…" },
      "groups": ["group-web-essentials"],   // 展开进 members
      "extra": ["dsh-notification"] }       // 再加这些插件
  ]
}
```

```bash
tools/gen_agents.py            # 写出描述符
tools/gen_agents.py --check    # CI 跑的
```

### 1.1 三条硬规则

| 规则 | 为什么 |
|---|---|
| **profile 名 = 包名**（生成器从 `name` 推导，不是可填字段） | `xlings install dsh:X` 之后必须是 `dsh --profile X`。装 `agent-web-coding` 却要启动 `coding`，读者没有依据知道这两个词是同一个，只会读成打错字。能授权用别的名字的只有上游文档，而这些 Agent 是本索引自己写的 |
| **成员必须已镜像** | 组合包是本索引的**可复现单元**。一个内容要在启动时回上游拉的"精选集"，会把镜像本来要消除的失败模式全部继承回来，却对外表现为已策展 |
| **两个成员不得替换同一个 `dsh-base` 行** | patch 替换整行 config 而不是合并，所以后装的成员静默胜出、前一个作者的意图消失。安装时这只能是告警（是用户在组合）；在组合包里是**索引**在组合，所以必须拒绝发布 |

行数据来自 `tools/mine_overrides.py`：读每个 bundle 自己的 `cordis.patch.yml`，
与 `@deepseek-ai/dsh-base` 的 row id 求交集。**实测不是人工标注** —— 68 个里
只有 5 个碰 base 行，真正两两相撞的只有 2 对。

### 1.2 成员是 pin 死的

生成器把每个成员的 `version` 和 `commit` 写进 `members`，模板据此发出
`deps = { "dsh:<name>@<version>", ... }`。没有版本的话 deps 会解析到当天的
`latest`，`agent-web-coding@0.1.0` 就会在任何成员发版后悄悄指代另一批字节。

### 1.3 Agent 的主张写在哪

dsh 有四层 patch，只有 **profile 自己的 `cordis.patch.yml`** 既持久又
per-profile（bundle 层属于插件作者，`$DSH_HOME/cordis.patch.yml` 是机器级，
`--patch` 不持久）。所以一个 Agent 要说"我这套里 persona 该长这样、某行该关掉"，
只能写在这儿 —— 描述符里的 `dsh.patch` 字段。

---

## 2) 定义一个插件

```lua
package = {
    spec = "1",

    name = "dsh-tool-csv",
    description = "CSV 读写工具，给 dsh 提供表格类 tool",
    repo = "https://github.com/dsh-external/dsh-tool-csv",
    homepage = "https://github.com/dsh-external/dsh-tool-csv",
    licenses = {"MIT"},
    authors = {"dsh-external"},

    status = "dev",                        -- dev / stable / deprecated
    categories = {"dsh-plugin", "tool"},
    keywords = {"dsh", "csv"},

    dsh = {
        kind = "plugin",
        -- 这个插件自己 README 让读者输入的 profile 名
        profile = "web",

        bundle_name = "@dsh-external/dsh-tool-csv",   -- 上游 package.json#name

        versions = {
            ["0.1.0"] = { commit = "<40 位小写 hex>" },
        },
        latest = "0.1.0",

        needs_build = false,               -- 上游根 package.json 有 scripts.prepare 即 true

        -- mirror 块由 tools/mirror.py 在发布完可验证的 tarball 后写入，不手填
    },
}
```

### 2.1 字段规则（硬约束）

| 字段 | 规则 |
|---|---|
| `kind` | 必填，`plugin` / `group` / `profile` 之一 |
| `profile` | 记录**上游 README 让读者输入的名字**，不推导。实测 65 个说 `web`，2 个 `tui`，1 个 `cc-tui` |
| `bundle_name` | 上游 `package.json#name`。它是 profile 清单记录的名字，**卸载靠它匹配**；不发布到 npm 的包由本索引给合成名 `@dsh-external/<name>` |
| `versions[v].commit` | **必须**是 40 位小写 hex。拼作 `commit` 而不是 `ref` —— xpkg 已经用 `ref` 表示别名（`["latest"] = { ref = "2.13.5" }`），模板还会把那种形式写进同一个文件 |
| `latest` | 必须是 `versions` 里真实存在的键 |
| `needs_build` | 显式声明，因为它标记"组合这个包会在用户机器上执行上游代码" |
| `licenses` | 用 xpkg 标准字段，**不要**写 `dsh.license`。它是镜像的门：缺席 = 上游没声明 = 无再分发权，fail-closed |

**为什么永远 pin commit**：生态里有 36 个社区仓库把自己命名进 `@deepseek-ai/`
—— DeepSeek 在 npm 上真正拥有的作用域。今天裸名 404；等官方真发了同名包，
它会**静默解析到完全不同的代码**。

**裸名 ≠ 已发布**：`bundle_name` 只是包自己 `package.json` 的 name。68 个里 19 个
用合成名，剩下 49 个裸名中只有 18 个真在 npm 上。站点的原生安装命令因此在生成期
实测 `tools/check_npm.py`，**连版本一起验** —— `dsh-tui` 在 npm 上，但我们 pin 的
`0.2.1` 不在，所以它必须退回 git spec。

---

## 3) 不要碰 template.lua，除非范式真的变了

它是全仓 71+ 个包共用的唯一生命周期实现。改它 = 改所有包。

只有以下情况才动：上游改了 `dsh plugin` 的命令形状、改了 profile / bundle 清单
结构，或者发现新的 runtime 陷阱（§4）。

**加一个包时改 `template.lua` 几乎总是错的** —— 先问：这是描述符能表达的差异
（多一个 `dsh.*` 字段），还是真的范式差异？

---

## 4) 两个 Lua 运行时（这一节是用事故换来的）

| 运行时 | 跑什么 | 缺什么 |
|---|---|---|
| **构建沙箱**（libxpkg plain-Lua） | `pkgindex-build.lua` + 每个描述符的顶层代码 | `cprintf` / `try {}` / `raise` / `os.getwinsize` 全是 nil |
| **hook runtime** | `installed` / `install` / `config` / `uninstall` | `os.files` / `os.dirs` / `os.filedirs` 是 nil |

**踩到构建沙箱那一列的任何一个，构建出的索引会静默丢掉全部 xpm 段** ——
包看起来还在，装的时候全挂。用 `pcall` 而不是 `try {}`；`error` 而不是 `raise`。

**hook runtime 那一列同样静默**：`os.files` 曾让一个 Agent 在五个成员都已组合完
之后才炸，堆栈指向 Agent 而不是那个 glob。需要定位依赖的文件时用
`pkginfo.dep_install_dir()` 加**推导**，不要 glob —— xpkg 装进
`<store>/dsh-x-<name>/<version>`，tarball 叫 `<name>-<version>.tgz`，
所以版本是路径最后一段，文件名由它得出，且不会和成员描述符漂移。

**回归门**：`lua5.4 tests/libxpkg_sandbox_harness.lua .`，必须进 CI。
它复刻那个沙箱并断言模板真的被追加上了。这是这套机制唯一的保护。
跑完记得 `git checkout -- pkgs/` —— harness 会就地追加。

### 4.1 hook 结尾要断言产物

hook 抛错后安装目录里往往只剩一个 `.xpkg.lua`，而外层可能仍然打印
`✓ N package(s) installed`。所以每个 hook 结尾断言**真正的产物**，不要只
`return true`：模板的 `install()` 用 `os.isfile(<tarball>)`，
Agent 的 `config()` 用 `installed()` 去读 profile 清单。

### 4.2 测之前先清同名同版本

xlings 在同名同版本已装在另一个 namespace 下时会**整个跳过 install hook 并照常
打印成功**：

```bash
rm -rf ~/.xlings/data/xpkgs/{dsh,local}-x-<name>/<version>
```

另外，往 local index 放两个 `package.name` 相同的文件，会让**整个 local repo
静默从搜索路径消失**。

---

## 5) 隔离合规（禁止事项）

- ❌ `os.exec("xvm add ...")` —— xvm 走 libxpkg API
- ❌ 改 `.bashrc` / shell profile；`os.addenv("PATH")` / `os.setenv("PATH")`
- ❌ `apt install` / `brew install` / `pacman -S`
- ❌ 删除 `$DSH_HOME` 下的任何用户数据 —— 本索引从未创建过它

| 约束 | 原因 |
|---|---|
| 插件与 group 注册 `type = "group"` | 它们不对应可执行文件。留成默认 program 类型会生成永远失败的 shim，`self doctor` 报为孤儿（openxlings/xlings#452） |
| Agent 注册 `alias = "dsh --profile <name>"` | 它**确实**给你一个命令。名字归 xvm 管，所以带版本、按 subos —— 两个版本可以同时装着，`xlings use` 切换 |
| 索引不再自带构建授权开关 | `pnpm store add` 只取不构建，索引不执行上游代码了。真正的门是 pnpm 的 `allowBuilds`，守在代码真会执行的那一步（用户组合时）。自己再造一道只是弱化副本 |
| 环境变量叫 `XIM_DSH_PROFILE` | dsh 全树只读 `DSH_HOME` / `DSH_WEB_URL` / `DSH_TELEMETRY_DISABLED`。叫 `DSH_PROFILE` 等于宣称一个并不存在的上游约定 |

---

## 6) 标准流程

**新增插件**

1. 确认它**真的是 bundle**：上游根 `package.json` 有 `dsh.bundle`。没有的话它只是
   个普通依赖，装了不激活任何层 —— 不收录
2. `tools/discover.py --new` 会做完 1~3 步并产出 JSON；`tools/sync.py --new` 落盘
3. 跑 §7 的检查
4. 隔离 `DSH_HOME` + 隔离 `XLINGS_HOME` 真装真卸一遍
5. 按 `pr-workflow` skill 提 PR

**新增 Agent / group**

1. 改 `tools/agents.json`
2. `tools/gen_agents.py`
3. 跑 §7 的检查（含成员镜像与行冲突两道门）
4. 真装 → `dsh --profile <name> --dump-config` 看层 → 真卸
5. 提 PR

---

## 7) 提 PR 前必跑

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .   # 构建沙箱回归门（先跑这个）
git checkout -- pkgs/                        # harness 会追加，还原
pytest -m "static or isolation" -q
tools/gen_agents.py --check
tools/add_kind.py --check
```

PR 里要写清楚：沙箱门结果、真装真卸的**实际输出**（不是"应该可以"）、
未跑项及其原因。详见 `pr-workflow` skill。
