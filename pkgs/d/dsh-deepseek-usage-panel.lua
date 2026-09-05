package = {
    spec = "1",

    name = "dsh-deepseek-usage-panel",
    description = "一个用于DeepSeek Harness（DSH）的用量监测面板（目前仅支持DeepSeek官方模型）",
    repo = "https://github.com/WeiyangPro/dsh-deepseek-usage-panel",
    homepage = "https://github.com/WeiyangPro/dsh-deepseek-usage-panel",
    licenses = {"MIT"},
    authors = {"WeiyangPro"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deepseek-usage-panel",

        versions = {
            ["0.2.1"] = { commit = "4d2a2fed1bf5463d0c91a1533cff6f13b1e3ba40" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
