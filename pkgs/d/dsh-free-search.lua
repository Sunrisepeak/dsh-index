package = {
    spec = "1",

    name = "dsh-free-search",
    description = "Free web search provider for DeepSeek Harness - DuckDuckGo backend, no API key needed",
    repo = "https://github.com/DDDMUC/dsh-free-search",
    homepage = "https://github.com/DDDMUC/dsh-free-search",
    licenses = {"MIT"},
    authors = {"DDDMUC"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-free-search",

        versions = {
            ["0.4.5"] = { commit = "274266442c2338e48fd53df1ca7269bb1c7d2462" },
        },
        latest = "0.4.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
