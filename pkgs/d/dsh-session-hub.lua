package = {
    spec = "1",

    name = "dsh-session-hub",
    description = "Aggregate and natively control multiple remote DeepSeek Harness (DSH) servers' sessions from one official Web UI — hub gateway + official-UI bridge. 多服务器 DSH 会话聚合与原生操控",
    repo = "https://github.com/Asaiuta/dsh-session-hub",
    homepage = "https://github.com/Asaiuta/dsh-session-hub",
    licenses = {"MIT"},
    authors = {"Asaiuta"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-hub",

        versions = {
            ["0.1.0-alpha.2"] = { commit = "79a8bf519f61797c9f507d99fa5653c026e798d4" },
        },
        latest = "0.1.0-alpha.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
