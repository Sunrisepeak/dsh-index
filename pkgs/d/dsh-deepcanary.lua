package = {
    spec = "1",

    name = "dsh-deepcanary",
    description = "Know when your DeepSeek Harness tasks need you. Local alerts, quiet notifications, and a task inbox.",
    repo = "https://github.com/Oscar-Williams/dsh-deepcanary",
    homepage = "https://github.com/Oscar-Williams/dsh-deepcanary",
    licenses = {"MIT"},
    authors = {"Oscar-Williams"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deepcanary",

        versions = {
            ["0.1.4-rc.1"] = { commit = "229b824f8dd0d9ac249af00fa6b104e7c3f8064a" },
        },
        latest = "0.1.4-rc.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
