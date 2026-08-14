package = {
    spec = "1",

    name = "dsh-plugin-mineru",
    description = "DSH plugin exposing MineRU document parsing tools to the model",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-mineru",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-mineru",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "plugin", "mineru"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@huanlin/dsh-plugin-mineru",

        versions = {
            ["0.2.0"] = { commit = "edfab2bf0b7a1083beeaef90947d1096a31ca84b" },
        },
        latest = "0.2.0",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
