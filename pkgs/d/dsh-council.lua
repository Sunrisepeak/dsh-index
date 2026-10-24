package = {
    spec = "1",

    name = "dsh-council",
    description = "Multi-model council for DeepSeek Harness: independent answers, anonymous peer reviews, and an inspectable final decision.",
    repo = "https://github.com/a1exsun/dsh-council",
    homepage = "https://github.com/a1exsun/dsh-council",
    licenses = {"MIT"},
    authors = {"a1exsun"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@a1exsun/dsh-council",

        versions = {
            ["0.1.0"] = { commit = "d195761c3d7e7f62acc6e792a8b2d44859d9ced5" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
