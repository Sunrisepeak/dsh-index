package = {
    spec = "1",

    name = "dsh-playwright-browser",
    description = "Playwright browser automation for DeepSeek Harness｜面向 DeepSeek Harness 的 Playwright 浏览器自动化插件",
    repo = "https://github.com/Clizo1209/dsh-playwright-browser",
    homepage = "https://github.com/Clizo1209/dsh-playwright-browser",
    licenses = {"MIT"},
    authors = {"Clizo1209"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-playwright-browser",

        versions = {
            ["0.1.3"] = { commit = "e6131c5de3a45f4f48dc81f76895abfcafb4cf02" },
        },
        latest = "0.1.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
