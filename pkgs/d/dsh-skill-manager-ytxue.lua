package = {
    spec = "1",

    name = "dsh-skill-manager-ytxue",
    description = "DSH web plugin: skill manager in the Settings sidebar - list/enable/disable, folder batch import with conflict prompts, state-driven one-click DSH-spec check & auto-fix, system/project scope labels.",
    repo = "https://github.com/YTxue/dsh-skill-manager-ytxue",
    homepage = "https://github.com/YTxue/dsh-skill-manager-ytxue",
    licenses = {"MIT"},
    authors = {"YTxue"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skill-manager-ytxue",

        versions = {
            ["0.6.0"] = { commit = "f254f3005a446062e312144f27ed0820d38d4654" },
        },
        latest = "0.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
