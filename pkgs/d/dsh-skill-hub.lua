package = {
    spec = "1",

    name = "dsh-skill-hub",
    description = "DeepSeek Harness（dsh）Web GUI 技能中枢：浏览/搜索完整本地技能目录、启用/禁用、查看正文、排查诊断、新建技能，基于官方 ctx.skills 注册表。 In-GUI skill hub for dsh: browse, search, enable/disable, inspect, diagnose and scaffold local skills from the official ctx.skills registry.",
    repo = "https://github.com/cheshireez/dsh-skill-hub",
    homepage = "https://github.com/cheshireez/dsh-skill-hub",
    licenses = {"MIT"},
    authors = {"cheshireez"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skill-hub",

        versions = {
            ["0.3.4"] = { commit = "c1b15e1a55a6e3f78694318887001731b3eeb278" },
        },
        latest = "0.3.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
