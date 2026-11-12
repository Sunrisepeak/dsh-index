package = {
    spec = "1",

    name = "dsh-think-game",
    description = "Inline mini-game arcade for DSH streaming reasoning / 流式思考下方的轻量小游戏（7 款游戏，自动暂停/淡出，可继续上一局）",
    repo = "https://github.com/NorthGateChat/dsh-think-game",
    homepage = "https://github.com/NorthGateChat/dsh-think-game",
    licenses = {"MIT"},
    authors = {"NorthGateChat"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-think-game",

        versions = {
            ["0.2.0"] = { commit = "12be73781405933c8ba2db4eeb5084f994c6bb2b" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
