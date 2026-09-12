package = {
    spec = "1",

    name = "dsh-raw-html-v2",
    description = "VCP visual-synesthesia plugin v2 for DeepSeek Harness (official Slot API): raw-HTML vcp-root cards, streaming render, KaTeX/Mermaid/SVG, builtin fonts",
    repo = "https://github.com/plolpl789/dsh-raw-html-v2",
    homepage = "https://github.com/plolpl789/dsh-raw-html-v2",
    authors = {"plolpl789"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-raw-html-v2",

        versions = {
            ["0.7.29"] = { commit = "2ca44076a282189327a0fe8f63ec8b51de8b0179" },
        },
        latest = "0.7.29",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
