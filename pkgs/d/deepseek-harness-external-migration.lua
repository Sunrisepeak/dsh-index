package = {
    spec = "1",

    name = "deepseek-harness-external-migration",
    description = "**DeepSeek-Harness Migration Plugin** 是一款专为 [DeepSeek-Harness](https://github.com/deepseek-ai/deepseek-harness) 设计的插件，旨在帮助开发者无缝迁移其他主流 AI 编程助手（Codex、Claude Code、Qcoder、OpenCode）的个性化配置及历史会话记录。无需手动复制粘贴，即可在 DeepSeek-Harness 中继续之前的工作流，大幅降低切换成本。",
    repo = "https://github.com/buguoshixc/deepseek-harness-external-migration",
    homepage = "https://github.com/buguoshixc/deepseek-harness-external-migration",
    licenses = {"MIT"},
    authors = {"buguoshixc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-external-migration",

        versions = {
            ["0.1.0"] = { commit = "12218a3f6d59370567ab92e6bde410ca4ccdd769" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
