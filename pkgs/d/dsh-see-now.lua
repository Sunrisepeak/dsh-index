package = {
    spec = "1",

    name = "dsh-see-now",
    description = "让 AI 实时看见你的屏幕：按变化量筛选帧、多帧拼进一张图，静止画面几乎不花 token",
    repo = "https://github.com/SAOS-3624/dsh-see-now",
    homepage = "https://github.com/SAOS-3624/dsh-see-now",
    licenses = {"Apache-2.0"},
    authors = {"SAOS-3624"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-see-now",

        versions = {
            ["0.0.6"] = { commit = "916354d36e58fdd843fff96284ff7c985bd00020" },
        },
        latest = "0.0.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
