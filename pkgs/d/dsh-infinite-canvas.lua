package = {
    spec = "1",

    name = "dsh-infinite-canvas",
    description = "Infinite Canvas — a node-based short-drama studio plugin for DeepSeek Harness: script, multi-shot storyboard, reference-consistent assets, one-shot video generation and final cut. Local-first, bring your own models.",
    repo = "https://github.com/NINKCH/dsh-infinite_canvas",
    homepage = "https://github.com/NINKCH/dsh-infinite_canvas",
    licenses = {"Apache-2.0"},
    authors = {"NINKCH"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@ninkch/dsh-infinite-canvas",

        versions = {
            ["0.19.18"] = { commit = "c709eb2fb7ea3de9569bd326c46ee47e762aa6b1" },
        },
        latest = "0.19.18",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
