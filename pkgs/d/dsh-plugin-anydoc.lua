package = {
    spec = "1",

    name = "dsh-plugin-anydoc",
    description = "DSH 插件：基于 @firecrawl/anydoc 将 Word、PPT、Excel、PDF、EPUB、CSV 等文档转换为 GitHub-Flavored Markdown",
    repo = "https://github.com/beancookie/dsh-plugin-anydoc",
    homepage = "https://github.com/beancookie/dsh-plugin-anydoc",
    authors = {"beancookie"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-anydoc",

        versions = {
            ["0.1.0"] = { commit = "3af159ed06f62f3d2c61ab21c6a2475c71efbfa4" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
