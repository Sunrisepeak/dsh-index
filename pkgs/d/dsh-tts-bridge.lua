package = {
    spec = "1",

    name = "dsh-tts-bridge",
    description = "DSH 朗读桥：会话里的话自动交给 DeepSeek 网页端朗读，声音从你自己的电脑里出来",
    repo = "https://github.com/Yuuyuko-uu/dsh-tts-bridge",
    homepage = "https://github.com/Yuuyuko-uu/dsh-tts-bridge",
    authors = {"Yuuyuko-uu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tts-bridge",

        versions = {
            ["1.2.9"] = { commit = "d112dd26ed3e7d8179f767bcf523b74aee4a1251" },
        },
        latest = "1.2.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
