package = {
    spec = "1",

    name = "dsh-token-panel",
    description = "A corner HUD for DeepSeek Harness that shows your session's token pressure, per-model cost, and daily/monthly usage at a glance, with an editable budget and balance that tracks spending for you. 右下角常驻的 Token 仪表盘：实时看会话压力、按模型估算花费。预算和余额点一下就能改，每天每月用了多少都有记录。",
    repo = "https://github.com/juhe291/dsh-token-panel",
    homepage = "https://github.com/juhe291/dsh-token-panel",
    licenses = {"MIT"},
    authors = {"juhe291"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-token-panel",

        versions = {
            ["0.3.0"] = { commit = "4868988d951efd0c2915195ddcf087dfd1924d5c" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
