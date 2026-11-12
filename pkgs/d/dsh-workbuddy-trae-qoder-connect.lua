package = {
    spec = "1",

    name = "dsh-workbuddy-trae-qoder-connect",
    description = "把 WorkBuddy（多账号/企业版）、Trae CN / TRAE SOLO CN、Qoder CN 三家订阅聚合进同一个 DSH 模型选择器：会话内换模型不丢历史、积分倍率、逐模型思考档位、每日自动签到、读图与 Agent 工具调用。One DSH plugin aggregating WorkBuddy / Trae / Qoder subscriptions into one model picker: mid-session switching, credit multipliers, reasoning effort, daily check-in, vision, tools.",
    repo = "https://github.com/chengshenyangtai/dsh-workbuddy-trae-qoder-connect",
    homepage = "https://github.com/chengshenyangtai/dsh-workbuddy-trae-qoder-connect",
    licenses = {"MIT"},
    authors = {"chengshenyangtai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-workbuddy-trae-qoder-connect",

        versions = {
            ["0.3.2"] = { commit = "2b4f433f005b4622303b8539c1b2800e3a2fa56d" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
