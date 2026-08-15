package = {
    spec = "1",

    name = "freestyle-dsh-theme",
    description = "DeepSeek Harness 主题体验插件：OKLCH 主题提案 + 主题设计器（跨重启持久化）",
    repo = "https://github.com/suzike/freestyle-dsh-theme",
    homepage = "https://github.com/suzike/freestyle-dsh-theme",
    licenses = {"BSD-3-Clause"},
    authors = {"suzike"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@linxin666/freestyle-dsh-theme",

        versions = {
            ["0.1.0"] = { commit = "cd9e9eb53ccbaded4cf6123919e24392daeda0d4" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
