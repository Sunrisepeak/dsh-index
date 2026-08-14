package = {
    spec = "1",

    name = "dsh-skillradar",
    description = "DSH plugin: scans session-visible skills and ranks them by relevance to the recent conversation.",
    repo = "https://github.com/hellosky983/dsh-skillradar",
    homepage = "https://github.com/hellosky983/dsh-skillradar",
    licenses = {"MIT"},
    authors = {"hellosky983"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skillradar",

        versions = {
            ["0.1.0"] = { commit = "45dab57d8d970cc7d079be60413bf3643d665a89" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
