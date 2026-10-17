package = {
    spec = "1",

    name = "dsh-whale-girl-pet",
    description = "🐋 DeepSeek 娘桌宠：住进 DeepSeek Harness Web 界面的蓝发鲸鱼女仆。工作链路、任务完成统计（用时/消耗/花费）、睡眠系统、时间感知、余额/天气/喂食按钮、完整设置面板。",
    repo = "https://github.com/yanzwzz/dsh-whale-girl-pet",
    homepage = "https://github.com/yanzwzz/dsh-whale-girl-pet",
    licenses = {"MIT"},
    authors = {"yanzwzz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-girl-pet",

        versions = {
            ["0.3.9"] = { commit = "4ce3dc5a36864fd2c608e3532ec1be91e1852173" },
        },
        latest = "0.3.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
