package = {
    spec = "1",

    name = "dsh-plugin-interpreters",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-interpreters",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-interpreters",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-interpreters",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "tools"},
    keywords = {"dsh", "plugin", "interpreters"},

    dsh = {
        bundle_name = "@huanlin/dsh-plugin-interpreters",

        versions = {
            ["0.1.0"] = { commit = "c58309173c575f821fb81d3ac8c8809eba467ed5" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
