package = {
    spec = "1",

    name = "graph-memory",
    description = "Openclaw记忆插件Knowledge Graph + Memory；Knowledge Graph Context Engine for OpenClaw — extracts structured triples from conversations, compresses context 75%, enables cross-session experience reuse",
    repo = "https://github.com/adoresever/graph-memory",
    homepage = "https://github.com/adoresever/graph-memory",
    licenses = {"MIT"},
    authors = {"adoresever"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "graph-memory",

        versions = {
            ["1.6.0-beta.1"] = { commit = "dbd72ccf2ea0a8a2f18a4ed384b55d2161347c80" },
        },
        latest = "1.6.0-beta.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
