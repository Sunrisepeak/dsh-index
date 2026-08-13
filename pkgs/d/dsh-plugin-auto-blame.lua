package = {
    spec = "1",

    name = "dsh-plugin-auto-blame",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-auto-blame",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-auto-blame",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-auto-blame",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "plugin", "auto", "blame"},

    dsh = {
        bundle_name = "@huanlin/dsh-plugin-auto-blame",

        versions = {
            ["0.1.0"] = { commit = "5ffbdfc6208f61624852eb21d4a5c2a52d05590e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
