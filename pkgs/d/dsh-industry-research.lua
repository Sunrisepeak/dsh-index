package = {
    spec = "1",

    name = "dsh-industry-research",
    description = "Industry and company research domain pack for DeepSeek Harness: methodology skills, industry chain mapping, public-source policy/news tracking, company research cards, and auditable research reports. Research only - not investment advice.",
    repo = "https://github.com/PerryLink/dsh-industry-research",
    homepage = "https://github.com/PerryLink/dsh-industry-research",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-industry-research",

        versions = {
            ["0.3.0"] = { commit = "89edf0498802143654982f327081c04977f75b9a" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
