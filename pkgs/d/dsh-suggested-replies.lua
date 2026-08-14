package = {
    spec = "1",

    name = "dsh-suggested-replies",
    description = "DSH Web 预测回复插件：AI 回复后在输入框上方生成可点击填入草稿的下一步消息候选",
    repo = "https://github.com/Anionex/dsh-suggested-replies",
    homepage = "https://github.com/Anionex/dsh-suggested-replies",
    licenses = {"MIT"},
    authors = {"Anionex"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@anionex/dsh-suggested-replies",

        versions = {
            ["0.1.0"] = { commit = "eb7e41b82ae80d01ae09b6e2641156dc21fdd01e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
