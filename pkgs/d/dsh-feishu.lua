package = {
    spec = "1",

    name = "dsh-feishu",
    description = "The Feishu UI for DeepSeek Harness  — a panel-driven control console: every slash command a button on the ⚙️ control-panel card, in-card approvals & questions, live streaming cards, one-QR setup. | DeepSeek Harness 的飞书 UI：面板驱动控制台——每个命令都是卡片按钮，卡内审批与提问，流式卡片，扫码一键配置。",
    repo = "https://github.com/PGZXB/dsh-feishu",
    homepage = "https://github.com/PGZXB/dsh-feishu",
    licenses = {"MIT"},
    authors = {"PGZXB"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "feishu",

        bundle_name = "@dsh-feishu/dsh-feishu",

        versions = {
            ["0.2.0"] = { commit = "df7a26863b0ba4b2041d42842cf058324463a5c5" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
