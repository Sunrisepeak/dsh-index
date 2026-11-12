package = {
    spec = "1",

    name = "dsh-engram",
    description = "dsh-engram",
    repo = "https://github.com/kenz1117/dsh-engram",
    homepage = "https://github.com/kenz1117/dsh-engram",
    licenses = {"MIT"},
    authors = {"kenz1117"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@kenz1117/dsh-engram",

        versions = {
            ["0.9.3"] = { commit = "1aa2e820bf1a9ab0e914bd6f1c1290b3c39d9778" },
        },
        latest = "0.9.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
