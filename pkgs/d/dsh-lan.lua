package = {
    spec = "1",

    name = "dsh-lan",
    description = "为DeepSeek  harness开启局域网访问及移动端页面的插件",
    repo = "https://github.com/MrMu666/dsh-LAN",
    homepage = "https://github.com/MrMu666/dsh-LAN",
    authors = {"MrMu666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-LAN",

        versions = {
            ["1.0.0"] = { commit = "1f21b308b2972d7237d63da823dc6c5fb89da966" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
