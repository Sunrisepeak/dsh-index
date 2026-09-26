package = {
    spec = "1",

    name = "deepseek-pet",
    description = "在你的deepseek-harness上养一只吃白饭的大蓝鲸",
    repo = "https://github.com/keleus/deepseek-pet",
    homepage = "https://github.com/keleus/deepseek-pet",
    licenses = {"MIT"},
    authors = {"keleus"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-pet",

        versions = {
            ["0.1.0"] = { commit = "287414d31c9a8fe4122109e85d8fe9dc0299cdc4" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
