package = {
    spec = "1",

    name = "dsh-lark-meeting-notifier",
    description = "一个只有副作用的DeepSeekHarness插件：在你跟 AI 聊得神魂颠倒时，提醒你「该去跟碳基生命开会了」。",
    repo = "https://github.com/yeruizhi/dsh-lark-meeting-notifier",
    homepage = "https://github.com/yeruizhi/dsh-lark-meeting-notifier",
    licenses = {"MIT"},
    authors = {"yeruizhi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-lark-meeting-notifier",

        versions = {
            ["0.1.0"] = { commit = "9254c621a4c8de43fd771d130791c65a224e7a45" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
