package = {
    spec = "1",

    name = "zhihu-search",
    description = "DeepSeek Harness plugin, Skill, CLI and MCP for Zhihu search, Zhida ask, and official open-platform APIs",
    repo = "https://github.com/klarkxy/zhihu-search",
    homepage = "https://github.com/klarkxy/zhihu-search",
    authors = {"klarkxy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-zhihu-search",

        versions = {
            ["1.6.0"] = { commit = "e1e2fedf20336933365da761fa07d30e704a749f" },
        },
        latest = "1.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
