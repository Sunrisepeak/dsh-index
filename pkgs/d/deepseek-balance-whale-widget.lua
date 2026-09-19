package = {
    spec = "1",

    name = "deepseek-balance-whale-widget",
    description = "DeepSeek Harness（DSH）一只住在 DSH 界面右下角的小鲸鱼娘，帮你盯着DeepSeek账户余额。QQ弹弹，支持拖拽吸附、左吸附翻转、数字滚动动画，随界面自动启用，建议直接喊来你的dsh安装",
    repo = "https://github.com/MeteorNOX/DeepSeek-Balance-Whale-Widget",
    homepage = "https://github.com/MeteorNOX/DeepSeek-Balance-Whale-Widget",
    authors = {"MeteorNOX"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-widget",

        versions = {
            ["0.1.0"] = { commit = "65497d4719e27fe70198ad25eb00016a7f2fcb98" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
