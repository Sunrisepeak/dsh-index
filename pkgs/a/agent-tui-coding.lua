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
        profile = "agent-tui-coding",

        -- Expanded by tools/gen_agents.py; template.lua composes
        -- these at install time and cannot read another descriptor,
        -- so the list is flat rather than a reference. `bundle` is
        -- the name the profile manifest records, which is what
        -- `dsh plugin remove` matches on.
        members = {
            { name = "dsh-cc-tui", bundle = "dsh-cc-tui" },
            { name = "dsh-notification", bundle = "dsh-notification" },
        },

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
