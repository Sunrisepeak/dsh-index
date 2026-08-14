package = {
    spec = "1",

    name = "seektty",
    description = "Pluggable DeepSeek-colored TUI for DeepSeek Harness",
    repo = "https://github.com/Hilbert-beinghappy/seektty",
    homepage = "https://github.com/Hilbert-beinghappy/seektty",
    licenses = {"MIT"},
    authors = {"Hilbert-beinghappy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "seektty",

        versions = {
            ["0.1.0"] = { commit = "664c2d883be9102701a6dc94a67e1e206530c8d2" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
