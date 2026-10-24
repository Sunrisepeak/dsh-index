package = {
    spec = "1",

    name = "prts-terrarchive",
    description = "为明日方舟的长篇剧情打造的RAG类DSH插件，拥有多种快速检索能力。",
    repo = "https://github.com/HTian-qwq/prts-terrarchive",
    homepage = "https://github.com/HTian-qwq/prts-terrarchive",
    licenses = {"MIT"},
    authors = {"HTian-qwq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "prts-terrarchive",

        versions = {
            ["0.1.0"] = { commit = "636edc12371de3caaa50dd56f66a5f5a962179e6" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
