package = {
    spec = "1",

    name = "chiral-pulse",
    description = "chiral-pulse",
    repo = "https://github.com/MoonShadow1976/chiral-pulse",
    homepage = "https://github.com/MoonShadow1976/chiral-pulse",
    licenses = {"MIT"},
    authors = {"MoonShadow1976"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "chiral-pulse",

        versions = {
            ["1.2.6"] = { commit = "78acd0561b1763b63010dba46c3f67eaf2ab9f91" },
        },
        latest = "1.2.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
