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
        bundle_name = "@huanlin/dsh-plugin-sleep",

        versions = {
            ["0.1.0"] = { commit = "daeeaeecd5b3fa46431f6eddb598aec22adfb84c" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
