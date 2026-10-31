package = {
    spec = "1",

    name = "dsh-approve-for-me",
    description = "DeepSeek Harness plugin for rule-gated automatic sandbox approval with optional LLM review, one-time grants, fixed high-risk checks, and native human fallback.",
    repo = "https://github.com/timeance/dsh-approve-for-me",
    homepage = "https://github.com/timeance/dsh-approve-for-me",
    licenses = {"MIT"},
    authors = {"timeance"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-approve-for-me",

        versions = {
            ["0.1.0-beta.3"] = { commit = "b22695df059185f2591c122473c33822c40a9a4e" },
        },
        latest = "0.1.0-beta.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
