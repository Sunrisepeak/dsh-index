package = {
    spec = "1",

    name = "huashu-excel",
    description = "数据分析与 Excel 全流程 skill：体检脏表、清洗、对齐需求、分析、对账、交付。让 AI 算出来的数字经得起追问。跨 agent 通用，依赖仅 openpyxl。",
    repo = "https://github.com/alchaincyf/huashu-excel",
    homepage = "https://github.com/alchaincyf/huashu-excel",
    licenses = {"MIT"},
    authors = {"alchaincyf"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "huashu-excel",

        versions = {
            ["1.1.0"] = { commit = "2492fabbafc8498496edd70f7e2354016a8dd06e" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
