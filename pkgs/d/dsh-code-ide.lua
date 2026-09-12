package = {
    spec = "1",

    name = "dsh-code-ide",
    description = "DeepSeek Harness的 IDE插件，以最小破坏性的方式增加代码审阅能力",
    repo = "https://github.com/SakalioLabs/dsh-code-ide",
    homepage = "https://github.com/SakalioLabs/dsh-code-ide",
    licenses = {"MIT"},
    authors = {"SakalioLabs"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-code-ide",

        versions = {
            ["0.1.0-alpha.0"] = { commit = "f0cab39070705e4ff895f54b67fb967c38ff88c2" },
        },
        latest = "0.1.0-alpha.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
