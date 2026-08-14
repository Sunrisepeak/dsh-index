package = {
    spec = "1",

    name = "dsh-file-claim",
    description = "File claim / protection for concurrent DeepSeek Harness (DSH) sessions working the same workspace: claim/release, heartbeat stale takeover, async pending merge area (git 3-way merge). DSH Host plugin.",
    repo = "https://github.com/Nwflower/dsh-file-claim",
    homepage = "https://github.com/Nwflower/dsh-file-claim",
    licenses = {"MIT"},
    authors = {"Nwflower"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-file-claim",

        versions = {
            ["0.1.6"] = { commit = "65aebf02cd881af9d170af692f17189bf785cb8a" },
        },
        latest = "0.1.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
