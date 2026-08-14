package = {
    spec = "1",

    name = "dsh-pdf",
    description = "PDF toolbox for DeepSeek Harness: extract text, metadata, and page ranges via pdfjs-dist (local, no API key)",
    repo = "https://github.com/sunshine-lang/dsh-pdf",
    homepage = "https://github.com/sunshine-lang/dsh-pdf",
    licenses = {"MIT"},
    authors = {"sunshine-lang"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-pdf",

        versions = {
            ["0.1.0"] = { commit = "bfb4231ab6ca748871d679bb2895631262a9685f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
