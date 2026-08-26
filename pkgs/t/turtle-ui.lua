package = {
    spec = "1",

    name = "turtle-ui",
    description = "as is, no warranty",
    repo = "https://github.com/turtle1999/turtle-ui",
    homepage = "https://github.com/turtle1999/turtle-ui",
    licenses = {"BSD-3-Clause"},
    authors = {"turtle1999"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tui",

        bundle_name = "@deepseek-ai/dsh-tui",

        versions = {
            ["0.0.1"] = { commit = "b08ed69e4c4edbd0dcaba556fa7b5ea6cd0f91e2" },
        },
        latest = "0.0.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
