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
        bundle_name = "@huanlin/dsh-plugin-yet-another-subagent",
        source = "github",
        origin = "HuanLinOTO/dsh-plugin-yet-another-subagent",

        versions = {
            ["0.1.1"] = { ref = "13cff4dac7487e92ab319de5f7355d2c40799dea" },
        },
        latest = "0.1.1",

        needs_build = false,
        license = "NOASSERTION",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
