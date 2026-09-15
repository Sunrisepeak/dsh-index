package = {
    spec = "1",

    name = "dsh-plugin-guide",
    description = "Installable DSH bundle: the dsh-plugin-guide plugin-development knowledge base as an on-demand agent skill. Official docs archive (EN/ZH), Cordis primer, 114-repo community archive, 1654 archived Discussions, 20+ battle-tested pitfalls.",
    repo = "https://github.com/PerryLink/dsh-plugin-guide",
    homepage = "https://github.com/PerryLink/dsh-plugin-guide",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-guide",

        versions = {
            ["0.1.0"] = { commit = "b0ae3f19f4318ababbceeb7df6c0a2f5009d7f2b" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
