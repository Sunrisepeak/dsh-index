package = {
    spec = "1",

    name = "dsh-quota-meter",
    description = "Per-session quota meter for DSH: real-token billing, live progress bar, budget blocking, configurable multi-model pricing. 会话额度监控：真实记账、进度条、额度拦截、价目可配。",
    repo = "https://github.com/ai-shushu/dsh-quota-meter",
    homepage = "https://github.com/ai-shushu/dsh-quota-meter",
    authors = {"ai-shushu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "quota-meter-shushu",

        versions = {
            ["0.4.0"] = { commit = "2097652d19313713e7a23fecfaba91a05651c17e" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
