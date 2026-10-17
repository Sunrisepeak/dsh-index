package = {
    spec = "1",

    name = "catppuccin-dsh-theme",
    description = "🐱 Soothing pastel theme for DeepSeek Harness",
    repo = "https://github.com/zhijun-dai/Catppuccin-dsh-theme",
    homepage = "https://github.com/zhijun-dai/Catppuccin-dsh-theme",
    authors = {"zhijun-dai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-catppuccin",

        versions = {
            ["0.2.1"] = { commit = "9885d3e7ee93ad4c972e92be4b6f301105e73eb4" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
