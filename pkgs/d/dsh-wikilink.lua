package = {
    spec = "1",

    name = "dsh-wikilink",
    description = "Obsidian-style [[wikilink]] mentions for the DeepSeek Harness web GUI: fuzzy-search note titles and attach their contents to the prompt",
    repo = "https://github.com/zhaoscsc/dsh-wikilink",
    homepage = "https://github.com/zhaoscsc/dsh-wikilink",
    licenses = {"MIT"},
    authors = {"zhaoscsc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-wikilink",

        versions = {
            ["0.1.0"] = { commit = "4400ff643ae17c883a7b14d05a3a596174137d49" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
