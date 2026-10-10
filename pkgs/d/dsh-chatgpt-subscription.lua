package = {
    spec = "1",

    name = "dsh-chatgpt-subscription",
    description = "dsh-chatgpt-subscription",
    repo = "https://github.com/Aa728848/dsh-chatgpt-subscription",
    homepage = "https://github.com/Aa728848/dsh-chatgpt-subscription",
    licenses = {"MIT"},
    authors = {"Aa728848"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@eddyskywalker/dsh-chatgpt-subscription",

        versions = {
            ["0.2.10"] = { commit = "97a97927143655714bbc030d3748ec0ea1474359" },
        },
        latest = "0.2.10",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
