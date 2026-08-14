package = {
    spec = "1",

    name = "dsh-better-archive",
    description = "DeepSeek Harness (DSH) web-GUI plugin: archived-session panel with unarchive & delete",
    repo = "https://github.com/huahai0202/dsh-better-archive",
    homepage = "https://github.com/huahai0202/dsh-better-archive",
    licenses = {"MIT"},
    authors = {"huahai0202"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-better-archive",

        versions = {
            ["0.1.0"] = { commit = "47074316abfbe809757b10377f25c5dbb0630518" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
