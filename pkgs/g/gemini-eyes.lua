package = {
    spec = "1",

    name = "gemini-eyes",
    description = "gemini-eyes",
    repo = "https://github.com/ConsoleSun/Gemini-Eyes",
    homepage = "https://github.com/ConsoleSun/Gemini-Eyes",
    authors = {"ConsoleSun"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-gemini-eyes-bundle",

        versions = {
            ["0.1.0"] = { commit = "1084aadf16d62f9a92e3fdf0473ccecffec47763" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
