package = {
    spec = "1",

    name = "tydora",
    description = "Let Your Ideas Flow — Tydora is a modern desktop Markdown editor combining WYSIWYG editing, bidirectional links, mind maps, and an infinite canvas — empowering deep thinking and effortless expression.",
    repo = "https://github.com/zuorn/Tydora",
    homepage = "https://github.com/zuorn/Tydora",
    licenses = {"Apache-2.0"},
    authors = {"zuorn"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "tydora",

        versions = {
            ["0.1.7"] = { commit = "23c45464a280876ad85317edbd9cbe517157872c" },
        },
        latest = "0.1.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
