package = {
    spec = "1",

    name = "dsh-miku-skin",
    description = "初音未来主题皮肤，用于 DeepSeek Harness (DSH) Web GUI —— 蓝紫洋红渐变、毛玻璃面板、可自定义背景图、亮暗双主题",
    repo = "https://github.com/stushansusu/dsh-miku-skin",
    homepage = "https://github.com/stushansusu/dsh-miku-skin",
    licenses = {"BSD-3-Clause"},
    authors = {"stushansusu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-client-ui-skin-miku",

        versions = {
            ["1.0.0"] = { commit = "6ccdceb5184c2f71821676764e5109fec99af46b" },
        },
        latest = "1.0.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
