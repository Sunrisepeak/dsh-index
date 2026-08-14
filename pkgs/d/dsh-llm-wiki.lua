package = {
    spec = "1",

    name = "dsh-llm-wiki",
    description = "dsh-llm-wiki",
    repo = "https://github.com/detpecca/dsh-llm-wiki",
    homepage = "https://github.com/detpecca/dsh-llm-wiki",
    licenses = {"MIT"},
    authors = {"detpecca"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@detpecca/dsh-llm-wiki",

        versions = {
            ["0.3.0"] = { commit = "8dd7a7a5bcb5e14e276fd8d6e6d172294355c5c9" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
