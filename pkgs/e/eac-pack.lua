package = {
    spec = "1",

    name = "eac-pack",
    description = "Embracing All Creation (Plugin Suite) — Dedicated to the Harmonious Coexistence of Hundreds of DSH Plugins / 揽尽万象（插件整合包） —— 致力于让数百个DSH插件和谐共存",
    repo = "https://github.com/DSH-EAC/EAC-Pack",
    homepage = "https://github.com/DSH-EAC/EAC-Pack",
    authors = {"DSH-EAC"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "eac-plugin-suite",

        versions = {
            ["0.2.4"] = { commit = "45651235fd76941c0963e83839b239366cafee32" },
        },
        latest = "0.2.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
