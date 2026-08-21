package = {
    spec = "1",

    name = "dsh-plugin-yet-another-subagent",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-yet-another-subagent",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-yet-another-subagent",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-yet-another-subagent",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "workflow"},
    keywords = {"dsh", "plugin", "yet", "another", "subagent"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@huanlin/dsh-plugin-yet-another-subagent",

        versions = {
            ["0.1.3"] = { commit = "5356af9d0f4d00cb97e7f5b476aa7949797811d5" },
            ["0.1.1"] = { commit = "13cff4dac7487e92ab319de5f7355d2c40799dea" },
        },
        latest = "0.1.3",

        -- Base rows this bundle replaces. Another bundle patching
        -- any of these in the same profile silently wins or loses,
        -- depending on install order.
        overrides = {"tool-subagent"},
        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
