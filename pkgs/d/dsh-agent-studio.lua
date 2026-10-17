package = {
    spec = "1",

    name = "dsh-agent-studio",
    description = "可视化地自定义配置 Agent 的提示词（prompt）、工具（tools）、可见技能（skills）、子代理、备用模型，轻松创建团队。",
    repo = "https://github.com/thissensen/dsh-agent-studio",
    homepage = "https://github.com/thissensen/dsh-agent-studio",
    licenses = {"MIT"},
    authors = {"thissensen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agent-studio",

        versions = {
            ["0.1.4"] = { commit = "6e92a94df43ae7b2ca36fa5f77c6b1d8820d7555" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
