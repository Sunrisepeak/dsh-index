package = {
    spec = "1",

    name = "modsearch",
    description = "The web plugin for DeepSeek Harness, and the search bridge for every model without native web access. Ask the web or X, get structured JSON evidence. | DeepSeek Harness 的 web 插件，为不能联网的模型补上搜索。问网页或 X，拿回结构化 JSON 证据（搜索、抓取、引用）。",
    repo = "https://github.com/liustack/modsearch",
    homepage = "https://github.com/liustack/modsearch",
    licenses = {"MIT"},
    authors = {"liustack"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@liustack/modsearch",

        versions = {
            ["5.4.2"] = { commit = "e1dba224b72651dfe7891990dcaf674098100df2" },
            ["5.4.1"] = { commit = "3f52f34f697b3de06b1315a083440d384e665748" },
        },
        latest = "5.4.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
