package = {
    spec = "1",

    name = "dsh-generative-ui",
    description = "Generative UI for DeepSeek Harness — the agent writes TSX and the web UI compiles every frame as it streams, so a card renders while its JSX is still unclosed. Inline in the conversation, or in a side canvas.",
    repo = "https://github.com/MindLab-Research/dsh-generative-ui",
    homepage = "https://github.com/MindLab-Research/dsh-generative-ui",
    licenses = {"Apache-2.0"},
    authors = {"MindLab-Research"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-generative-ui",

        versions = {
            ["0.2.0"] = { commit = "c5b66f11a215631ebd557963ac18d7b298436fc6" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
