package = {
    spec = "1",

    name = "dsh-rewind",
    description = "DeepSeek Harness plugin: in-place conversation rewind in the same session window (Claude Code /rewind semantics) + optional file restore",
    repo = "https://github.com/SiriLee/dsh-rewind",
    homepage = "https://github.com/SiriLee/dsh-rewind",
    licenses = {"MIT"},
    authors = {"SiriLee"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-rewind-plugin",

        versions = {
            ["0.3.2"] = { commit = "7788a032175c4231bdc84718e265c190802bb144" },
        },
        latest = "0.3.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
