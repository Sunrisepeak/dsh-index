package = {
    spec = "1",

    name = "agent-tui-coding",
    description = "A terminal coding Agent: the Claude Code style full-screen TUI surface with desktop notifications, booted with `dsh --profile agent-tui-coding`.",
    repo = "https://github.com/Sunrisepeak/dsh-index",
    homepage = "https://sunrisepeak.github.io/dsh-index",
    licenses = {"Apache-2.0"},
    authors = {"Sunrisepeak"},

    status = "dev",
    categories = {"dsh-agent"},
    keywords = {"dsh", "agent", "profile"},

    dsh = {
        kind = "profile",
        -- The UI this Agent boots into. It ships inside dsh
        -- itself, so it is a bundle name and not a dependency.
        surface = "dsh-cc-tui",
        profile = "agent-tui-coding",

        -- Expanded by tools/gen_agents.py; template.lua composes
        -- these at install time and cannot read another descriptor,
        -- so the list is flat rather than a reference. `bundle` is
        -- the name the profile manifest records, which is what
        -- `dsh plugin remove` matches on, and `version` pins the
        -- member so this Agent means one fixed set of bytes.
        members = {
            { name = "dsh-cc-tui", version = "0.1.6", bundle = "dsh-cc-tui", commit = "8516ffb3aac3ada74760eff9b8c14c65d344b67d" },
            { name = "dsh-notification", version = "0.1.1", bundle = "dsh-notification", commit = "3e33100f51f25f24cece20bfd3d50cfbde0cbca5" },
        },

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
