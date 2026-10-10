package = {
    spec = "1",

    name = "treg",
    description = "OpenRouter for agent tools. Join community here: https://discord.gg/6mQYYfFMAn",
    repo = "https://github.com/superdesigndev/treg",
    homepage = "https://github.com/superdesigndev/treg",
    authors = {"superdesigndev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "treg-dsh",

        versions = {
            ["0.11.0"] = { commit = "29902e09040d4d01e10ecebaba60a3d00163307d" },
        },
        latest = "0.11.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
