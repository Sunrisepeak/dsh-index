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
        -- so the list is flat rather than a reference.
        members = {
            "dsh-at-file",
            "dsh-annotation",
            "dsh-turn-rewind",
            "dsh-notification",
            "dsh-task-status",
        },

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
