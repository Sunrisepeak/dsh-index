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
            ["5.10.0"] = { commit = "81ed4d16fbdec19d078f7bfbeac11b6c5ceb1e80" },
            ["5.9.1"] = { commit = "1492d7b921dc526ccc21b65a3afbe91a7fbae12e" },
            ["5.9.0"] = { commit = "7be93eba6c0a07e523c8b10d2ca9dacccd10c131" },
            ["5.8.0"] = { commit = "05ee10dbc9c99508914e42616ba16790fd642031" },
            ["5.6.0"] = { commit = "a5bd55aa09e259e0c34e7f86377c0c4c6f295e55" },
            ["5.4.3"] = { commit = "548b7cc43f347e6c965edd053fe443ef66d26b68" },
            ["5.4.2"] = { commit = "e1dba224b72651dfe7891990dcaf674098100df2" },
            ["5.4.1"] = { commit = "3f52f34f697b3de06b1315a083440d384e665748" },
        },
        latest = "5.10.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
