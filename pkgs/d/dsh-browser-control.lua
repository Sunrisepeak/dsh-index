package = {
    spec = "1",

    name = "dsh-browser-control",
    description = "Chrome 浏览器扩展 + DeepSeek Harness 插件，让 AI Agent 直接操控你的真实浏览器。",
    repo = "https://github.com/caob23/dsh-browser-control",
    homepage = "https://github.com/caob23/dsh-browser-control",
    licenses = {"AGPL-3.0"},
    authors = {"caob23"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@caob23/dsh-browser-control",

        versions = {
            ["1.0.7"] = { commit = "27631487aaf7fddf2ce2e51926ad8849bb4feed4" },
        },
        latest = "1.0.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
