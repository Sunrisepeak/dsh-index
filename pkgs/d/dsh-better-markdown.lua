package = {
    spec = "1",

    name = "dsh-better-markdown",
    description = "DeepSeek Harness Web plugin powered by markstream-react for resilient streaming Markdown, Mermaid diagrams, KaTeX math, and safe renderer fallback.",
    repo = "https://github.com/zerob13/dsh-better-markdown",
    homepage = "https://github.com/zerob13/dsh-better-markdown",
    licenses = {"MIT"},
    authors = {"zerob13"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-better-markdown",

        versions = {
            ["0.1.2"] = { commit = "2241facb67ad88632e256ca6341b831c56b9dd30" },
        },
        latest = "0.1.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
