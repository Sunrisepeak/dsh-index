package = {
    spec = "1",

    name = "dsh-raw-html",
    description = "VCP visual-synesthesia protocol plugin for DeepSeek Harness: render agent HTML output as real UI (cards / KaTeX math / Mermaid diagrams / built-in calligraphy fonts / zero-JS interactions), plug-and-play on any DSH environment",
    repo = "https://github.com/plolpl789/dsh-raw-html",
    homepage = "https://github.com/plolpl789/dsh-raw-html",
    licenses = {"MIT"},
    authors = {"plolpl789"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-raw-html",

        versions = {
            ["0.4.0"] = { commit = "5bd943319abab47865bd8e6de795878d7c6221a2" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
