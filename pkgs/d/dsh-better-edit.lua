package = {
    spec = "1",

    name = "dsh-better-edit",
    description = "Hash-anchored read/edit/undo_last_edit tools for DeepSeek Harness (dsh)",
    repo = "https://github.com/Rianico/dsh-better-edit",
    homepage = "https://github.com/Rianico/dsh-better-edit",
    licenses = {"MIT"},
    authors = {"Rianico"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-better-edit",

        versions = {
            ["0.2.1"] = { commit = "37da85b797e13559cec738c2cae3f8830f0a7a29" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
