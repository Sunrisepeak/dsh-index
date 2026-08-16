package = {
    spec = "1",

    name = "harmony-next.skills",
    description = "🚀 Expert guidance for HarmonyOS NEXT (API 12+) development. Covers IDE operations, performance tuning, architecture (HAP/HAR/HSP), and automation testing.",
    repo = "https://github.com/linhay/harmony-next.skills",
    homepage = "https://github.com/linhay/harmony-next.skills",
    authors = {"linhay"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-harmony-next",

        versions = {
            ["1.3.35"] = { commit = "6ced249c92f0ba37919b117903f6ee1e35fe68f3" },
        },
        latest = "1.3.35",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
