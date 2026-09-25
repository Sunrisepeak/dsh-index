package = {
    spec = "1",

    name = "dsh-plugin-sleep",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-sleep",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-sleep",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-sleep",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "plugin", "sleep"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@huanlin/dsh-plugin-sleep",

        versions = {
            ["0.2.0"] = { commit = "6e9fab87c7efd87d0b96c19d6e8971cb106b4709" },
            ["0.1.6"] = { commit = "9dcf754be87a734aca889317d840c7ec6461f5bc" },
            ["0.1.5"] = { commit = "42cb80658a748e67aa689ec72835bb8289c4c49a" },
            ["0.1.4"] = { commit = "fb10a1388467fbc1cacaa180d828db6ec214310e" },
            ["0.1.0"] = { commit = "daeeaeecd5b3fa46431f6eddb598aec22adfb84c" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
