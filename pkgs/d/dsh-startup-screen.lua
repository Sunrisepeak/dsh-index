package = {
    spec = "1",

    name = "dsh-startup-screen",
    description = "dsh-startup-screen",
    repo = "https://github.com/6shenhonghong9/dsh-startup-screen",
    homepage = "https://github.com/6shenhonghong9/dsh-startup-screen",
    licenses = {"MIT"},
    authors = {"6shenhonghong9"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-startup-screen",

        versions = {
            ["1.2.0"] = { commit = "1f35ea33810e02a900b31df01f9c806f92f398df" },
        },
        latest = "1.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
