package = {
    spec = "1",

    name = "dsh-outline",
    description = "DeepSeek Harness（DSH）Web GUI 的实时大纲插件",
    repo = "https://github.com/urzeye/dsh-outline",
    homepage = "https://github.com/urzeye/dsh-outline",
    licenses = {"MIT"},
    authors = {"urzeye"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-outline",

        versions = {
            ["0.1.2"] = { commit = "4678ff557cc1bc55d3042e3d87d06951d8d74c76" },
        },
        latest = "0.1.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
