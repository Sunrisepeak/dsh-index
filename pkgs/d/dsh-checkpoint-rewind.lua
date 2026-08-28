package = {
    spec = "1",

    name = "dsh-checkpoint-rewind",
    description = "Claude Code /rewind for DeepSeek Harness — git-first workspace snapshots before every mutation, turn-boundary session forks, one-shot /rewind restore. A dsh-plugin capability seam.",
    repo = "https://github.com/PerryLink/dsh-checkpoint-rewind",
    homepage = "https://github.com/PerryLink/dsh-checkpoint-rewind",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-checkpoint-rewind",

        versions = {
            ["0.6.1"] = { commit = "591d8c2e41daae96d613a8b649432ca74f92ed7a" },
        },
        latest = "0.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
