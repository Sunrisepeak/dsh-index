package = {
    spec = "1",

    name = "dsh-fund-research",
    description = "DeepSeek Harness plugin: deterministic research reports for Chinese public mutual funds",
    repo = "https://github.com/PerryLink/dsh-fund-research",
    homepage = "https://github.com/PerryLink/dsh-fund-research",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-fund-research",

        versions = {
            ["0.3.0"] = { commit = "955c2b89deba67b69d154e1f8280368bbcf03384" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
