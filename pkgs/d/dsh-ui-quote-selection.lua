package = {
    spec = "1",

    name = "dsh-ui-quote-selection",
    description = "Codex-style select-to-quote for DeepSeek Harness Web: quote any chat text into the composer as a native reference chip.",
    repo = "https://github.com/nekogpt/dsh-ui-quote-selection",
    homepage = "https://github.com/nekogpt/dsh-ui-quote-selection",
    licenses = {"MIT"},
    authors = {"nekogpt"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ui-quote-selection",

        versions = {
            ["0.1.0"] = { commit = "728d16234d59908007754901e8e1c6a32824caf5" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
