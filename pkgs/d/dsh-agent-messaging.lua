package = {
    spec = "1",

    name = "dsh-agent-messaging",
    description = "Cross-session agent-to-agent messaging for DeepSeek Harness — address another session by name and deliver a message into its inbox.",
    repo = "https://github.com/happyren/dsh-agent-messaging",
    homepage = "https://github.com/happyren/dsh-agent-messaging",
    licenses = {"MIT"},
    authors = {"happyren"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agent-messaging",

        versions = {
            ["0.0.1"] = { commit = "d6fc3abfde2467aa5b6b5598fea2f0e1ece2fdac" },
        },
        latest = "0.0.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
