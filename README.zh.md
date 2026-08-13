# dsh-index

[English](README.md) | 中文

**DeepSeek Harness** 插件生态的 [xlings](https://github.com/openxlings/xlings)
包索引。命名空间：`dsh`。

## 安装

```bash
xlings install dsh pnpm -y
xlings config --index-repo dsh:https://github.com/Sunrisepeak/dsh-index.git
xlings install dsh:dsh-cc-tui -y
```

`pnpm` 是必须的：`dsh plugin` 本身就是一个 pnpm 转发器，上游也明确写了
profile 安装需要 PATH 上有 pnpm。

完整列表：**<https://sunrisepeak.github.io/dsh-index>**

## 这里的"插件"是什么

dsh 插件是一个 **profile bundle** —— 一个在 `package.json` 里声明
`"dsh": { "bundle": { "patch": "./cordis.patch.yml" } }` 的 npm 包。装一个插件
= 往 `$DSH_HOME/profiles/<name>` 加一条依赖，并往 `dsh.profile.bundles` 追加一层；
dsh 启动时按顺序组合这些层。

这是上游**唯一**的外部插件通道。旧的 `.dsh-plugin` / `repository-plugins` 格式
已于 2026-08-09 从主线删除。

profile 默认跟随当前 subos，所以进不同 subos 就是不同的插件集。可用
`DSH_PROFILE` 覆盖。

## 已镜像 vs 直连

每个包只会是两者之一，站点上有明确标注：

| | 已镜像 | 直连 |
|---|---|---|
| 字节来自 | xlings-res，带 sha256 校验 | GitHub，按 pin 的 commit |
| CN 加速 | 有 | 无 |
| 上游删库后 | 仍可安装 | 装不回来 |
| 带 `prepare` 脚本 | 已在本索引 CI 构建完 | 需要 `DSH_ALLOW_BUILDS=1` |

**判据是许可证**，不是偏好：镜像 = 再分发。在 `dsh-plugin` topic 下普查的
169 个 bundle 里，29 个完全没有 LICENSE、另有 13 个无法识别 —— 本索引无权镜像
它们，所以它们保持直连，并且如实标注。

## 新增一个插件

`pkgs/<首字母>/<name>.lua` 下的描述符**只有数据** —— 没有 hook、没有 `xpm`、
没有 `type`。全部生命周期来自 `template.lua`，由 `pkgindex-build.lua` 在索引
构建期追加到每个描述符尾部。一套范式，一份实现。

```lua
package = {
    spec = "1",
    name = "dsh-cc-tui",
    description = "Claude Code style full-screen terminal UI",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},

    dsh = {
        bundle_name = "dsh-cc-tui",
        source = "github",
        origin = "ccch1mneyyy/dsh-cc-tui",
        versions = { ["0.1.2"] = { ref = "<40 位 commit sha>" } },
        latest = "0.1.2",
        needs_build = false,
        license = "BSD-3-Clause",
    },
}
```

必须 pin 40 位 commit。这个生态里**包名不可信**：36 个社区仓库把自己命名进了
DeepSeek 在 npm 上真正拥有的 `@deepseek-ai/` scope，裸名安装可能静默解析到
完全不同的代码。

详见 [docs/contributing.md](docs/contributing.md)。

## 检查

```bash
lua5.4 tests/libxpkg_sandbox_harness.lua .   # 索引构建回归门
git checkout -- pkgs/                        # harness 会追加模板，跑完要复原
pytest -q                                    # 描述符 schema 与策略检查
```

沙箱回归门不是可选项。xlings 在 libxpkg 的最小 plain-Lua 沙箱里跑
`pkgindex-build.lua`，那里 `cprintf` / `try` / `raise` 全是 nil；漏进去一个，
构建出的索引会**静默丢掉全部 xpm 段**，所有走 artifact 路径的用户都装不上。

## 相关链接

- [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) · [插件文档](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/user/develop/basic/publish.zh.md)
- [`dsh-plugin` topic](https://github.com/topics/dsh-plugin) —— 上游指定的发现入口
- [xim-pkgindex](https://github.com/openxlings/xim-pkgindex) —— xlings 官方索引（`xim:dsh` 在那里）
- [awesome-dsh-plugins](https://github.com/AdamPlatin123/awesome-dsh-plugins) —— 生态兼容性报告

## 许可证

Apache-2.0。每个被收录的插件保留各自的许可证；本仓库只再分发许可证允许的那些。
