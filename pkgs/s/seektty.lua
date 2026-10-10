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
            ["1.0.0"] = { commit = "f40fb3ea2e7cb572ed25af727d347844b7e72446" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
