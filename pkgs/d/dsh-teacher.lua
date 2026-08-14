package = {
    spec = "1",

    name = "dsh-teacher",
    description = "DSH teacher plugin: Socratic tutor that leads you to answers from a markdown question set, tracks knowledge gaps in-session, and retests them on a spaced-repetition schedule.",
    repo = "https://github.com/Yihong89/dsh-teacher",
    homepage = "https://github.com/Yihong89/dsh-teacher",
    licenses = {"MIT"},
    authors = {"Yihong89"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-teacher",

        versions = {
            ["0.1.0"] = { commit = "d09a37e8c1da6dbc426fd59bd9ba7628f64bbbf9" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
