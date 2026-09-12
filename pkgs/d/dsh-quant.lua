package = {
    spec = "1",

    name = "dsh-quant",
    description = "\"🐳 Dsh-Quant: The Everything-Plugin Ai native Quant OS \"",
    repo = "https://github.com/pengpengyi92/dsh-quant",
    homepage = "https://github.com/pengpengyi92/dsh-quant",
    licenses = {"MIT"},
    authors = {"pengpengyi92"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-quant",

        versions = {
            ["0.41.0"] = { commit = "4e2925b4068bf37732f173ddca105f470086fd51" },
        },
        latest = "0.41.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
