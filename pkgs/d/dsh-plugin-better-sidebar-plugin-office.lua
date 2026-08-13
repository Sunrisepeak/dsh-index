package = {
    spec = "1",

    name = "dsh-plugin-better-sidebar-plugin-office",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-better-sidebar-plugin-office",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-better-sidebar-plugin-office",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-better-sidebar-plugin-office",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "plugin", "better", "sidebar", "plugin", "office"},

    dsh = {
        bundle_name = "@huanlin/dsh-plugin-better-sidebar-plugin-office",

        versions = {
            ["0.1.0"] = { commit = "04b338d345b4c40607b984c2c757179a17094f16" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
