package = {
    spec = "1",

    name = "dsh-go-rotator",
    description = "A plugin for DSH to swich opencode Go subscription",
    repo = "https://github.com/echo-xianyu/dsh-go-rotator",
    homepage = "https://github.com/echo-xianyu/dsh-go-rotator",
    licenses = {"MIT"},
    authors = {"echo-xianyu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-go-rotator",

        versions = {
            ["0.2.0"] = { commit = "2fdb831de692d6e18ce032e5385bc8766dc8078e" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
