package = {
    spec = "1",

    name = "dsh-uumit-remote",
    description = "dsh-uumit-remote",
    repo = "https://github.com/uumit-ai/dsh-uumit-remote",
    homepage = "https://github.com/uumit-ai/dsh-uumit-remote",
    licenses = {"MIT"},
    authors = {"uumit-ai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@uumit-ai/dsh-uumit-remote",

        versions = {
            ["0.1.0-beta.3"] = { commit = "9e64809f6db492f5eff4381cb90ddbbb7164c215" },
        },
        latest = "0.1.0-beta.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
