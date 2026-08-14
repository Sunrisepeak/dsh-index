package = {
    spec = "1",

    name = "agent-web-coding",
    description = "A ready-to-run coding Agent on the web surface: Agent = Harness + Plugins. Five composed plugins, booted with `dsh --profile agent-web-coding`.",
    repo = "https://github.com/Sunrisepeak/dsh-index",
    homepage = "https://sunrisepeak.github.io/dsh-index",
    licenses = {"Apache-2.0"},
    authors = {"Sunrisepeak"},

    status = "dev",
    categories = {"dsh-agent"},
    keywords = {"dsh", "agent", "profile"},

    dsh = {
        kind = "profile",
        profile = "agent-web-coding",

        -- Expanded by tools/gen_agents.py; template.lua composes
        -- these at install time and cannot read another descriptor,
        -- so the list is flat rather than a reference. `bundle` is
        -- the name the profile manifest records, which is what
        -- `dsh plugin remove` matches on.
        members = {
            { name = "dsh-at-file", bundle = "dsh-at-file" },
            { name = "dsh-annotation", bundle = "@omdsh-dev/dsh-annotation" },
            { name = "dsh-turn-rewind", bundle = "@dsh-external/turn-rewind" },
            { name = "dsh-notification", bundle = "dsh-notification" },
            { name = "dsh-task-status", bundle = "@dsh-external/dsh-task-status" },
        },

        -- Provenance for the expansion above.
        groups = {"group-web-essentials"},

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
