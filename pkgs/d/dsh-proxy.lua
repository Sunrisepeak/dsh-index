package = {
    spec = "1",

    name = "dsh-proxy",
    description = "HTTP + WebSocket 反向代理：把局域网端口转发到本地 DSH 服务",
    repo = "https://github.com/smanx/dsh-proxy",
    homepage = "https://github.com/smanx/dsh-proxy",
    authors = {"smanx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@smanx/dsh-proxy",

        versions = {
            ["0.1.1"] = { commit = "95e07fe4f2be31772188e7f6c55df9b0f2a17c18" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
