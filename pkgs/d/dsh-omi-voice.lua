package = {
    spec = "1",

    name = "dsh-omi-voice",
    description = "DeepSeek Harness 语音朗读插件：沉浸式听朗读，用豆包 TTS 自然音色读 AI 回复（BYOK · 点读/暂停/继续）",
    repo = "https://github.com/PolinniZhong/dsh-omi-voice",
    homepage = "https://github.com/PolinniZhong/dsh-omi-voice",
    licenses = {"MIT"},
    authors = {"PolinniZhong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-omi-voice",

        versions = {
            ["0.1.2"] = { commit = "92bf49d9bc17fa33eb48485c424d798b6eb5c97d" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
