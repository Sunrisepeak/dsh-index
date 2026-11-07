package = {
    spec = "1",

    name = "dsh-ai4scholar",
    description = "AI4Scholar for DeepSeek Harness (dsh): 38 native academic tools — Semantic Scholar, PubMed, Google Scholar, arXiv, bioRxiv/medRxiv, DOI, full text, auto-cite, figures, unified search. Powered by ai4scholar.net",
    repo = "https://github.com/literaf/dsh-ai4scholar",
    homepage = "https://github.com/literaf/dsh-ai4scholar",
    licenses = {"MIT"},
    authors = {"literaf"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ai4scholar",

        versions = {
            ["0.3.3"] = { commit = "500e49d004715908122b76fef90e1db05db7c7f4" },
        },
        latest = "0.3.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
