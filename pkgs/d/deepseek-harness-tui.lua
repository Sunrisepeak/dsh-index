package = {
    spec = "1",

    name = "deepseek-harness-tui",
    description = "Terminal-native interactive TUI for DeepSeek Harness (dsh) — built with Ink, React for terminals",
    repo = "https://github.com/gxinxing/deepseek-harness-tui",
    homepage = "https://github.com/gxinxing/deepseek-harness-tui",
    licenses = {"MIT"},
    authors = {"gxinxing"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "deepseek-harness-tui",

        versions = {
            ["0.1.0"] = { commit = "0c251a26a3228ffc6d4195f9dd31db45ddbc557f" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
