package = {
    spec = "1",

    name = "dsh-memgas",
    description = "DeepSeek Harness 长期记忆插件：四通道检索融合 + 记忆演化闭环，记忆构建与检索方法来自 ICLR 2026 论文 MemGAS。Long-term memory plugin for DeepSeek Harness (dsh).",
    repo = "https://github.com/quqxui/dsh-memgas",
    homepage = "https://github.com/quqxui/dsh-memgas",
    licenses = {"MIT"},
    authors = {"quqxui"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "dsh-memgas",

        versions = {
            ["0.2.1"] = { commit = "f4007386204d99f6a0926cf7a0484fab7b6a865d" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
