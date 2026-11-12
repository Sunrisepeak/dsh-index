package = {
    spec = "1",

    name = "dsh-armory",
    description = "All-in-one board for DeepSeek Harness: MCP manager + Skills + WorkBuddy experts (attach/switch/detach any time) + tool-usage tailor + three direct markets (WorkBuddy connectors, SkillHub 190k+ skills) with one-click install · DSH 一体化看板：MCP/技能/专家随时挂换/工具账本/三大市场直连安装",
    repo = "https://github.com/2026heshao/dsh-armory",
    homepage = "https://github.com/2026heshao/dsh-armory",
    licenses = {"MIT"},
    authors = {"2026heshao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-armory",

        versions = {
            ["2.4.3"] = { commit = "6229f9b6d2757aaaf2e4cbc4c679473f1715da70" },
        },
        latest = "2.4.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
