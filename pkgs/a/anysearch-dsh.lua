package = {
    spec = "1",

    name = "anysearch-dsh",
    description = "AnySearch web search provider and advanced search tools for DeepSeek Harness (DSH)",
    repo = "https://github.com/anysearch-team/anysearch-dsh",
    homepage = "https://github.com/anysearch-team/anysearch-dsh",
    licenses = {"MIT"},
    authors = {"anysearch-team"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@anysearch/anysearch-dsh",

        versions = {
            ["0.1.1"] = { commit = "2758d49bbe3d84528747845b598f1d415e0145f8" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
