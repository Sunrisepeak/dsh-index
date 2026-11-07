package = {
    spec = "1",

    name = "dsh-memewiki",
    description = "梗百科：内置 6792 条梗/黑话词库，自动查梗并注入上下文，让模型认得群里的梗，不硬猜。移植自 AstrBot 的 astrbot_plugin_memewiki。",
    repo = "https://github.com/thawline/dsh-memewiki",
    homepage = "https://github.com/thawline/dsh-memewiki",
    licenses = {"MIT"},
    authors = {"thawline"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-memewiki",

        versions = {
            ["0.1.20"] = { commit = "bf3155ad93dedfdbe37798680e79b5386503e38d" },
        },
        latest = "0.1.20",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
