package = {
    spec = "1",

    name = "deep-read-summarize",
    description = "Deep reading & summarization workflow for books/papers/videos/web — plugin parsers, MapReduce deep-read, JSON Schema output, Obsidian-ready (DSH)",
    repo = "https://github.com/PensiveFei/deep-read-summarize",
    homepage = "https://github.com/PensiveFei/deep-read-summarize",
    licenses = {"MIT"},
    authors = {"PensiveFei"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deep-read-summarize",

        versions = {
            ["0.1.0"] = { commit = "491a7cb0f5ec9e43d4134b7824081b6e172d882c" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
