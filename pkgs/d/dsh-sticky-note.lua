package = {
    spec = "1",

    name = "dsh-sticky-note",
    description = "左下角便签：随手记点子/感想/TODO，实时保存到归档目录，清单+悬浮归档",
    repo = "https://github.com/Meredith2328/dsh-sticky-note",
    homepage = "https://github.com/Meredith2328/dsh-sticky-note",
    licenses = {"MIT"},
    authors = {"Meredith2328"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-sticky-note",

        versions = {
            ["0.2.1"] = { commit = "ebabb6c746b1495c5f077e440d98b6665d7a61b9" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
