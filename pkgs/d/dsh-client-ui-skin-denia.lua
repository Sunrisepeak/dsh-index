package = {
    spec = "1",

    name = "dsh-client-ui-skin-denia",
    description = "DeepSeek Harness Web GUI 皮肤 · 鸣潮·达妮娅(Denia)主题「虚无之泡」。双形态亮/暗、侧边立绘、可修改的玻璃卡片、浮动泡泡粒子、锁链边框。",
    repo = "https://github.com/Ewnscat-ya/dsh-client-ui-skin-denia",
    homepage = "https://github.com/Ewnscat-ya/dsh-client-ui-skin-denia",
    authors = {"Ewnscat-ya"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-client-ui-skin-denia",

        versions = {
            ["0.0.4"] = { commit = "1b846939864137123203f1cc8db628e1331df62a" },
        },
        latest = "0.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
