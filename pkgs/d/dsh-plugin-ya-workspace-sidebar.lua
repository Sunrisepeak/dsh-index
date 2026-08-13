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
        bundle_name = "@huanlin/dsh-plugin-ya-workspace-sidebar",
        source = "github",
        origin = "HuanLinOTO/dsh-plugin-ya-workspace-sidebar",

        versions = {
            ["0.1.0"] = { ref = "afa7bf300f6c71a1a07361bace8941e6db9ba0f8" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NOASSERTION",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
