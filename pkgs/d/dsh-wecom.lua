package = {
    spec = "1",

    name = "dsh-wecom",
    description = "WeCom AI Bot channel for DeepSeek Harness — every chat runs a persistent, preset-backed agent with real tools.",
    repo = "https://github.com/TtTRz/dsh-wecom",
    homepage = "https://github.com/TtTRz/dsh-wecom",
    licenses = {"MIT"},
    authors = {"TtTRz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-wecom",

        versions = {
            ["0.1.6"] = { commit = "673c425ca56f6dc3f20d20782a2f1b655d00c59c" },
        },
        latest = "0.1.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
