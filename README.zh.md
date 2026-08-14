# dsh-index

[English](README.md) | 中文

**Agent = dsh + 一组插件。** 本索引同时浏览与分发这两者 ——
[DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) 生态的插件，
以及由它们组装成的完整 Agent。

站点：**<https://sunrisepeak.github.io/dsh-index>**

## 这个项目是什么

**1 · 生态浏览站。** 收录值得装的 dsh 插件，可搜索，标明它做什么、字节从哪来，
以及生态随时间的增长曲线。

**2 · 一条命令安装，两条路可选。** dsh 自己就能装插件，所以每个插件页**先给出它的
原生命令**；本索引的命令排在下面，补上 dsh 给不了的东西：sha256 校验与 CN 镜像。

**3 · Agent 的分发渠道。** `Agent = dsh + 一组插件` —— 在 dsh 自己的模型里
就是一个 *profile*。这里每个 Agent 是一个 xpkg 描述文件，`xlings install`
会解析成员、装齐、写好 profile，并**注册一个以包名命名的命令**。
一次安装，一个词就能跑：

```bash
xlings install dsh:agent-web-coding -y   →   agent-web-coding
```

profile 名同样是包名，所以 `dsh --profile agent-web-coding` 是同一件事的长写法。

## 快速开始

```bash
xlings install dsh -y
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git

xlings install dsh:agent-web-coding -y   # 一个完整 Agent
agent-web-coding                         # 运行它 —— 包名就是命令
```

最后一行不是笔误。**装完一个 Agent，你会得到一个以它命名的命令**，
经 xlings 的 `xvm` 注册，本质是 `dsh --profile agent-web-coding` 的别名。
因为这个名字归 xvm 管，**带版本、按 subos** 是白拿的：

```bash
xlings install dsh:agent-web-coding@0.2.0 -y
xlings use agent-web-coding 0.1.0        # 切换，只影响当前 subos
```

`dsh --profile agent-web-coding` 依然可用 —— 命令是别名，不是替代。

<details>
<summary>还没装 xlings？点开看安装命令</summary>

**Linux / macOS**
```bash
curl -fsSL https://d2learn.org/xlings-install.sh | bash
```

**Windows — PowerShell**
```powershell
irm https://d2learn.org/xlings-install.ps1.txt | iex
```

> 了解 xlings → [xlings.d2learn.org](https://xlings.d2learn.org)

</details>

## 三层

| 层 | 是什么 | 安装它会做什么 |
| --- | --- | --- |
| **插件** | 一个上游 bundle —— 原子 | 下载并 pin 好字节，打印出组合它的那一行 |
| **插件组** | 可干净共存的可复用组合 | 装齐全部成员 |
| **Agent** | `dsh + 一组插件` + 这个 Agent 自己的配置层 | 建它的 profile、把成员全部组合进去，并注册一个以包名命名的命令 |

插件组和 Agent **没有自己的字节**，它们是几百字节的清单，载荷在成员身上。
成员必须是已镜像的包 —— 一个内容要在启动时回上游拉的"精选集"，
会把镜像本来要消除的失败模式全部继承回来。

<details>
<summary>为什么 Agent 必须是一个包，而不能只是一个 YAML</summary>

dsh 的 profile 由四层 patch 组合而成，启动时还能再叠一层：

```bash
dsh --profile agent-web-coding --patch ./extra.yml
```

但 patch **只有配置、没有依赖声明**，而 dsh 的启动路径根本不碰包管理器。
让它引用一个你没装的插件，直接退出：

```
Error: dsh: plugin tree failed to load: failed to apply loader entry include
```

带依赖的是 profile 的 `package.json`，那才是 `pnpm install` 读的东西。
所以分发一个 Agent 需要"能执行安装"的东西 —— 而这正是 xpkg 的 `deps` 闭包。

</details>

## 安装

每个插件页都给出两条命令，它们**不等价**：

```bash
# dsh 原生 —— 装了 dsh 就能用，直连源头
dsh plugin --profile web add dsh-cc-tui@0.1.6

# 本索引 —— sha256 校验，许可证允许时还有 CN 镜像
xlings install dsh:dsh-cc-tui -y
```

原生命令的 spec 逐包不同，在**站点构建时实测决定**，绝不靠猜：npm 确实按我们
pin 的版本提供的走名字，其余走 pin 死的 commit。今天是 17 个走名字、51 个走
commit —— 裸 `bundle_name` 只是包自己 `package.json` 的 name，不代表已发布。

<details>
<summary>你需要的全部命令 —— 安装、切换、卸载</summary>

```bash
# 添加本索引（namespace: dsh）
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git

# 搜索与查看
xlings search dsh:tui
xlings list dsh:dsh-cc-tui

# 安装
xlings install dsh:agent-web-coding -y      # 一个 Agent
xlings install dsh:group-web-essentials -y  # 一个插件组
xlings install dsh:dsh-cc-tui -y            # 单个插件
xlings install dsh:dsh-cc-tui@0.1.6 -y      # 指定版本

# 改掉插件打印那一行里的 profile 名
XIM_DSH_PROFILE=work xlings install dsh:dsh-at-file -y

# 按 subos 切换版本 —— 对 Agent 来说就是切换它的命令指向哪个版本，
# 所以两个版本可以同时装着
xlings use agent-web-coding 0.1.0

# 卸载
xlings remove dsh:dsh-cc-tui -y
```

`XIM_DSH_PROFILE` 是本索引的变量，**故意不叫 `DSH_PROFILE`**：dsh 根本不读这个
变量（它只读 `DSH_HOME`、`DSH_WEB_URL`、`DSH_TELEMETRY_DISABLED`），
用那个名字等于宣称一个并不存在的上游约定。

</details>

<details>
<summary>插件装到哪去了？怎么启动？</summary>

**装一个插件不会把它放进任何 profile。** 取字节和做组合是两件事、两个主人，
所以原子只负责取，并打印出组合它的那一行：

```
dsh-at-file is downloaded and pinned. It is not in any profile yet.
  Add it:     dsh plugin --profile web add /…/dsh-at-file-0.1.0.tgz
  Launch it:  dsh web
```

原来原子自己注册的时候，装一个 Agent 会连带把它的五个成员也塞进 `web`
—— 因为每个成员在 Agent 还没运行时就已经替自己决定了归属。

| 你装的是 | profile | 启动 |
| --- | --- | --- |
| 一个 Agent | 它自己的包名，已替你组合好 | `dsh --profile <包名>` |
| 一个插件组 | 无；成员只是被取下来，没有被组合 | — |
| 单个插件 | 在你粘贴那一行之前，无 | `dsh web`，或 `dsh --profile <name>` |

那行里的 profile 是插件自己 README 所写的名字（65 个 `web`，2 个 `tui`，
1 个 `cc-tui`）—— 本索引**不发明名字**，换成任何名字都行。Agent 用自己的包名，
所以 `xlings install dsh:X` 之后一定是 `dsh --profile X`；一个东西两个名字，
读者没有办法知道它们是同一个。

```bash
# 实际装了什么，以及层的组合顺序
cat ~/.dsh/profiles/<profile>/package.json
dsh --profile <profile> --dump-config | grep '^# == '
```

</details>

## 已镜像 vs 直连

每个插件二选一，站点上有标：

| | 已镜像 | 直连 |
|---|---|---|
| 字节来自 | xlings-res，带 sha256 | GitHub，pin 死的 commit |
| CN 镜像 | 有 | 无 |
| 上游删库后 | 仍可安装 | 没了 |
| 带 `prepare` 脚本 | 已在本索引 CI 里构建 | pnpm 会拦住，需你显式允许 |

**由许可证决定**，不是偏好：镜像即再分发。在 `dsh-plugin` topic 调研的 169 个
bundle 里，29 个完全没有 LICENSE，另有 13 个无法识别 —— 本索引无权镜像它们，
所以它们保持直连并如实标注。

## 新增一个插件

`pkgs/<首字母>/<名字>.lua` 下的描述符是**纯数据** —— 没有 hook、没有 `xpm`、
没有 `type`。全部生命周期来自 `template.lua`，由 `pkgindex-build.lua` 在索引构建
时追加到每个描述符。一套范式，一份实现。

```lua
package = {
    spec = "1",
    name = "dsh-cc-tui",
    description = "Claude Code 风格全屏终端界面",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},

    dsh = {
        kind = "plugin",
        profile = "cc-tui",             -- 它自己 README 让读者输入的名字
        bundle_name = "dsh-cc-tui",
        versions = { ["0.1.6"] = { commit = "<40 位 sha>" } },
        latest = "0.1.6",
        needs_build = false,
    },
}
```

永远 pin 40 位 commit。这个生态里包名不可信：36 个社区仓库把自己命名进了
DeepSeek 在 npm 上真正拥有的 `@deepseek-ai/` 作用域，裸名可能悄悄解析到别的代码。

插件组和 Agent 由 `tools/gen_agents.py` 从 `tools/agents.json` **生成**；
改源文件，不要改描述符。CI 会重跑展开，两者不会漂移。

详见 [docs/contributing.md](docs/contributing.md)。

## 保持跟进

`tools/discover.py` 扫描 `dsh-plugin` topic，回答三个**分开的**问题，
每个问题各自成为一个 PR：

```bash
tools/discover.py --new     # 索引还没收录的仓库
tools/discover.py --bump    # 已收录但上游发了新版
tools/discover.py --audit   # 已收录但 pin 的 commit 在上游消失了
```

`--audit` **永不自动合入**。pin 的 sha 消失意味着 force push 或删库，
静默跟进会让"本索引 pin 死这些字节"这个承诺无声失效。

## 检查

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .   # 索引构建回归门
git checkout -- pkgs/                        # harness 会追加，跑完还原
pytest -q                                    # 描述符 schema 与策略
tools/gen_agents.py --check                  # 组合包与其源文件一致
```

沙箱门不是可选项。xlings 在 libxpkg 的最小 plain-Lua 沙箱里运行
`pkgindex-build.lua`，那里 `cprintf` / `try` / `raise` 全是 nil；
混进任何一个，构建出的索引会**静默丢掉全部 xpm 段**，
走 artifact 路径的所有用户安装都会挂。

## 相关链接

- [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) · [插件文档](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/user/develop/basic/publish.md)
- [`dsh-plugin` topic](https://github.com/topics/dsh-plugin) —— 上游的发现入口
- [xim-pkgindex](https://github.com/openxlings/xim-pkgindex) —— xlings 官方索引（`xim:dsh` 在那里）
- [awesome-dsh-plugins](https://github.com/AdamPlatin123/awesome-dsh-plugins) —— 生态兼容性报告

## 许可证

Apache-2.0。每个被收录的插件保留自己的许可证；本仓库只再分发许可证允许的那些。
