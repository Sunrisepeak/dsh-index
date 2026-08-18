package = {
    spec = "1",

    name = "dskin",
    description = "DSKIN · DeepSeek Harness（DSH）卡通像素皮肤插件 / Cartoon pixel skin plugin for DSH Web GUI — 原始界面不动，像素宠物会散步、眨眼、跳跃 / living pixel pets that stroll, blink and hop",
    repo = "https://github.com/dancingmemory/dskin",
    homepage = "https://github.com/dancingmemory/dskin",
    licenses = {"MIT"},
    authors = {"dancingmemory"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dskin",

        versions = {
            ["1.0.14"] = { commit = "acee0ab04c5257cce7f2045c8fe2f62926ee54a6" },
            ["1.0.13"] = { commit = "db96586db61f6e27dcd8769c1f543625f855888f" },
        },
        latest = "1.0.14",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
