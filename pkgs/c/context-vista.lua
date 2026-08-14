package = {
    spec = "1",

    name = "context-vista",
    description = "为 DeepSeek Harness 提供右侧悬浮栏以及 /context 命令，用环形图实时展示当前上下文 token 用量与分配，compact指令效果，同时支持估算费用消耗，对标 Claude Code 的 /context。",
    repo = "https://github.com/GooodWei/context-vista",
    homepage = "https://github.com/GooodWei/context-vista",
    licenses = {"MIT"},
    authors = {"GooodWei"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "context-vista",

        versions = {
            ["0.1.0"] = { commit = "3983907140abfb754aa72f07e30afb6fa9564d22" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
