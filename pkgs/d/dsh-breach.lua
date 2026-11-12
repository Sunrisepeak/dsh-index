package = {
    spec = "1",

    name = "dsh-breach",
    description = "DSH 插件：由 dsh-purge 剥离出的破甲单件 —— 提示词注入 + 可回滚宿主补丁引擎（本机结算 72 项）",
    repo = "https://github.com/zhuchongba-01/dsh-breach",
    homepage = "https://github.com/zhuchongba-01/dsh-breach",
    licenses = {"MIT"},
    authors = {"zhuchongba-01"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-breach",

        versions = {
            ["1.3.4"] = { commit = "bee2790f6574be3e9c967bd0a060e551a3de709c" },
        },
        latest = "1.3.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
