package = {
    spec = "1",

    name = "dsh-knowledge",
    description = "Knowledge base & RAG plugin for DeepSeek Harness (DSH): chunking, local embeddings, hybrid search, management panel",
    repo = "https://github.com/Soren-ABT/dsh-knowledge",
    homepage = "https://github.com/Soren-ABT/dsh-knowledge",
    licenses = {"AGPL-3.0"},
    authors = {"Soren-ABT"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-knowledge",

        versions = {
            ["0.3.3"] = { commit = "60d80a6f8f6af2f6c749b6a7cfbbf9f12bb26670" },
        },
        latest = "0.3.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
