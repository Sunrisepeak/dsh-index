package = {
    spec = "1",

    name = "dsh-plugin-ya-workspace-sidebar",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-ya-workspace-sidebar",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-ya-workspace-sidebar",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-ya-workspace-sidebar",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "plugin", "workspace", "sidebar"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@huanlin/dsh-plugin-ya-workspace-sidebar",

        versions = {
            ["0.2.0"] = { commit = "bc41513c7b2bd3bbd853947437974bdeb42ce19d" },
            ["0.1.0"] = { commit = "afa7bf300f6c71a1a07361bace8941e6db9ba0f8" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
