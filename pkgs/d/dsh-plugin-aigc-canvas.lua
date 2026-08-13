package = {
    spec = "1",

    name = "dsh-plugin-aigc-canvas",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-aigc-canvas",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-aigc-canvas",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-aigc-canvas",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "plugin", "aigc", "canvas"},

    dsh = {
        bundle_name = "@huanlin/dsh-plugin-aigc-canvas",

        versions = {
            ["0.1.0"] = { commit = "3685141d2b995c71a15ed6fc1f3628a6268f3194" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
