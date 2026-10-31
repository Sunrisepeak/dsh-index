package = {
    spec = "1",

    name = "dsh-our-free-model",
    description = "在 dsh 里装上这个插件即可，无需登录、注册或填 API Key，就能使用包括 Muse Spark 1.3、MiMo V2.6 在内的前沿模型——完全免费，不限量。 All you do is install this plugin in dsh: no login, no sign-up, no API key — the frontier models are just there, Muse Spark 1.3 and MiMo V2.6 among them. Completely free, with no usage cap.",
    repo = "https://github.com/zouyuxuan122/dsh-our-free-model",
    homepage = "https://github.com/zouyuxuan122/dsh-our-free-model",
    licenses = {"MIT"},
    authors = {"zouyuxuan122"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-our-free-model",

        versions = {
            ["1.2.1"] = { commit = "f34852ae083aa363eb7db9a579a53fd121ff1899" },
        },
        latest = "1.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
