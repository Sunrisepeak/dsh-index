package = {
    spec = "1",

    name = "dsh-ui-usage-billing",
    description = "Usage billing dashboard plugin for DeepSeek Harness: sidebar cost metrics, real usage aggregation from session logs, current multi-provider pricing catalog",
    repo = "https://github.com/kenz1117/dsh-ui-usage-billing",
    homepage = "https://github.com/kenz1117/dsh-ui-usage-billing",
    licenses = {"MIT"},
    authors = {"kenz1117"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@kenz1117/dsh-ui-usage-billing",

        versions = {
            ["1.0.1"] = { commit = "18c9c01f190d3086f928ea4d0f6bc9b988f26202" },
        },
        latest = "1.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
