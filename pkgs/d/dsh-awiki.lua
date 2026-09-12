package = {
    spec = "1",

    name = "dsh-awiki",
    description = "AWiki identity and messaging plugin for DeepSeek Harness",
    repo = "https://github.com/AgentConnect/dsh-awiki",
    homepage = "https://github.com/AgentConnect/dsh-awiki",
    licenses = {"MIT"},
    authors = {"AgentConnect"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@awiki/dsh-plugin",

        versions = {
            ["0.3.2"] = { commit = "c623e8835ff3ba69e8bc2df5f495fe15207aa928" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
