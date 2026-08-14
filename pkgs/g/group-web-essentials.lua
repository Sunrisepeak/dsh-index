package = {
    spec = "1",

    name = "group-web-essentials",
    description = "Five web-surface quality-of-life plugins that compose cleanly: @file mentions, inline annotation, turn rewind, desktop notifications and a background task bar.",
    repo = "https://github.com/Sunrisepeak/dsh-index",
    homepage = "https://sunrisepeak.github.io/dsh-index",
    licenses = {"Apache-2.0"},
    authors = {"Sunrisepeak"},

    status = "dev",
    categories = {"dsh-group"},
    keywords = {"dsh", "group"},

    dsh = {
        kind = "group",

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

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
