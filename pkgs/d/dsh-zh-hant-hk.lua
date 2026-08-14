package = {
    spec = "1",

    name = "dsh-zh-hant-hk",
    description = "DeepSeek Harness plugin: Hong Kong Traditional Chinese wording (對話, 設定, 儲存)",
    repo = "https://github.com/Argonaut790/dsh-zh-hant-hk",
    homepage = "https://github.com/Argonaut790/dsh-zh-hant-hk",
    licenses = {"MIT"},
    authors = {"Argonaut790"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-zh-hant-hk",

        versions = {
            ["0.1.5"] = { commit = "a92cc34779581ee6d9e670bb462e2ef5baa8730f" },
        },
        latest = "0.1.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
