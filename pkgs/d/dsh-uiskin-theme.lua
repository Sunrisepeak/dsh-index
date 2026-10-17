package = {
    spec = "1",

    name = "dsh-uiskin-theme",
    description = "Blue Glass Theme (ocean fantasy) for DeepSeek Harness Web — static profile bundle. 海洋幻想主题:海洋背景、玻璃气泡、海洋侧边栏、鲸鱼设置按钮、炫彩模型文字。安装: dsh plugin --profile web add github:chouxiaohuai/uiskin-theme",
    repo = "https://github.com/chouxiaohuai/dsh-uiskin-theme",
    homepage = "https://github.com/chouxiaohuai/dsh-uiskin-theme",
    authors = {"chouxiaohuai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "uiskin-theme",

        versions = {
            ["1.0.0"] = { commit = "ca84c53f2447a6d9b67454967763e55e39a7e373" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
