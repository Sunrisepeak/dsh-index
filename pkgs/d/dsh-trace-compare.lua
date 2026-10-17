package = {
    spec = "1",

    name = "dsh-trace-compare",
    description = "Trace Compare & Live Maze for DeepSeek Harness: visualize agent exploration (main path, detours, backtracks) from session logs or live sessions",
    repo = "https://github.com/lamost423/dsh-trace-compare",
    homepage = "https://github.com/lamost423/dsh-trace-compare",
    licenses = {"MIT"},
    authors = {"lamost423"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-trace-compare",

        versions = {
            ["0.3.3"] = { commit = "291b5edf3d3293a5da3be2d30b6ea07f66737c86" },
        },
        latest = "0.3.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
