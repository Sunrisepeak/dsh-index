package = {
    spec = "1",

    name = "dsh-whale-widget-plus",
    description = "基于DeepSeek-Balance-Whale-Widget开发，新增了不同版本的表情，需要那个版本的表情可以自己让agent帮你换，增加了火山coding plan额度查询，新增加台词自定义切换增加，增加了表情与台词手动切换",
    repo = "https://github.com/louke6572/dsh-whale-widget-plus",
    homepage = "https://github.com/louke6572/dsh-whale-widget-plus",
    licenses = {"MIT"},
    authors = {"louke6572"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-widget-plus",

        versions = {
            ["0.3.5"] = { commit = "200bf165aad0de391c22d4c48efe292bf580b66a" },
        },
        latest = "0.3.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
