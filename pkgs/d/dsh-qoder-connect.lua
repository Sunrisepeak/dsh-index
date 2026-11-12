package = {
    spec = "1",

    name = "dsh-qoder-connect",
    description = "将 Qoder（国内版/国际版）以 PAT 接入 DeepSeek Harness —— 侧栏额度展示、上下文窗口切换、模型自由开关、每日自动签到。Qoder CN & Global models for DeepSeek Harness via PAT. 支持 DSH 0.1.5-rc.1+。",
    repo = "https://github.com/masknull/dsh-qoder-connect",
    homepage = "https://github.com/masknull/dsh-qoder-connect",
    licenses = {"MIT"},
    authors = {"masknull"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-qoder-connect",

        versions = {
            ["0.2.3"] = { commit = "160461bc8d5905e79bef631eb5057dd918b7ca10" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
