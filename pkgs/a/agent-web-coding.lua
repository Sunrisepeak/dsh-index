package = {
    spec = "1",

    name = "agent-web-coding",
    description = "A ready-to-run coding Agent on the web surface: the harness plus five composed plugins, booted with `dsh --profile coding`.",
    repo = "https://github.com/Sunrisepeak/dsh-index",
    homepage = "https://sunrisepeak.github.io/dsh-index",
    licenses = {"Apache-2.0"},
    authors = {"Sunrisepeak"},

    status = "dev",
    categories = {"dsh-agent"},
    keywords = {"dsh", "agent", "profile"},

    dsh = {
        kind = "profile",
        profile = "coding",

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

        -- Provenance for the expansion above.
        groups = {"group-web-essentials"},

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
