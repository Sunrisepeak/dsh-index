package = {
    spec = "1",

    name = "dsh-plugin-healthcheck",
    description = "害怕插件装了就崩溃？用这个插件帮你检测插件是否正常/是否含木马！",
    repo = "https://github.com/chenw2759-wq/dsh-plugin-healthcheck",
    homepage = "https://github.com/chenw2759-wq/dsh-plugin-healthcheck",
    licenses = {"MIT"},
    authors = {"chenw2759-wq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-healthcheck",

        versions = {
            ["0.1.0"] = { commit = "0d29936305a1649a08625d70066d0c2c3ef1700b" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
