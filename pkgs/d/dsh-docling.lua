package = {
    spec = "1",

    name = "dsh-docling",
    description = "Native Docling document intelligence for DeepSeek Harness.",
    repo = "https://github.com/Sqhao-O/dsh-docling",
    homepage = "https://github.com/Sqhao-O/dsh-docling",
    licenses = {"MIT"},
    authors = {"Sqhao-O"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-docling",

        versions = {
            ["0.1.0"] = { commit = "6bee5ffbce5ae3f1efe37b20d8095ebf13b5ef06" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
