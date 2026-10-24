package = {
    spec = "1",

    name = "dsh-docs",
    description = "Fully local document intelligence for DeepSeek Harness. Parse PDF, Office files, images, and scanned documents with offline OCR. | DeepSeek Harness 全本地文档智能插件，支持 PDF、Office、图片与离线 OCR",
    repo = "https://github.com/Sqhao-O/dsh-docs",
    homepage = "https://github.com/Sqhao-O/dsh-docs",
    licenses = {"MIT"},
    authors = {"Sqhao-O"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-doc",

        versions = {
            ["0.1.1"] = { commit = "67d3ae944bba92b881255b5d11f08c20b806bd65" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
