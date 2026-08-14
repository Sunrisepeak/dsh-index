package = {
    spec = "1",

    name = "dsh-naiwa-theme",
    description = "为deepseek harness构建的奶蛙主题，可是我觉得很神圣呀。（素材来自互联网）",
    repo = "https://github.com/DevourerM/dsh-naiwa-theme",
    homepage = "https://github.com/DevourerM/dsh-naiwa-theme",
    licenses = {"MIT"},
    authors = {"DevourerM"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-naiwa-theme",

        versions = {
            ["0.5.0"] = { commit = "e25421d9247aceecdc97852091991708a5897df0" },
        },
        latest = "0.5.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
