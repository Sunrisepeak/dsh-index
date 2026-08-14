package = {
    spec = "1",

    name = "agent-tui-coding",
    description = "A terminal coding Agent: the Claude Code style full-screen TUI surface with desktop notifications, booted with `dsh --profile tui-coding`.",
    repo = "https://github.com/Sunrisepeak/dsh-index",
    homepage = "https://sunrisepeak.github.io/dsh-index",
    licenses = {"Apache-2.0"},
    authors = {"Sunrisepeak"},

    status = "dev",
    categories = {"dsh-agent"},
    keywords = {"dsh", "agent", "profile"},

    dsh = {
        kind = "profile",
        profile = "tui-coding",

        -- Expanded by tools/gen_agents.py; template.lua composes
        -- these at install time and cannot read another descriptor,
        -- so the list is flat rather than a reference.
        members = {
            "dsh-cc-tui",
            "dsh-notification",
        },

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
