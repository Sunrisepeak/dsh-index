package = {
    spec = "1",

    name = "deepseek-harness-desktop",
    description = "dsh-desktop: DeepSeek Harness 桌面插件 - click-to-launch Codex-like native window over the live dsh web UI. Everything is a plugin - this one is the window.",
    repo = "https://github.com/Muelsysel/DeepSeek-Harness-Desktop",
    homepage = "https://github.com/Muelsysel/DeepSeek-Harness-Desktop",
    licenses = {"MIT"},
    authors = {"Muelsysel"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-desktop",

        versions = {
            ["0.1.4"] = { commit = "d565ece53fe06a9d4029e7d2907db81481939679" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
