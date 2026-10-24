package = {
    spec = "1",

    name = "dsh-office-tools",
    description = "Model-facing Office tools for DeepSeek Harness: Word (.docx), Excel (.xlsx), and PowerPoint (.pptx) create/read/update with workspace-safe paths and PPT image embedding.",
    repo = "https://github.com/kw78/dsh-office-tools",
    homepage = "https://github.com/kw78/dsh-office-tools",
    licenses = {"MIT"},
    authors = {"kw78"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-office-tools",

        versions = {
            ["0.1.0"] = { commit = "d9b6923ba14a803c331111d7447846d6a6796550" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
