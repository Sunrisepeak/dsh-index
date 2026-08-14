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
        -- The UI this Agent boots into. It ships inside dsh
        -- itself, so it is a bundle name and not a dependency.
        surface = "@deepseek-ai/dsh-web-app",
        profile = "agent-web-coding",

        -- Expanded by tools/gen_agents.py; template.lua composes
        -- these at install time and cannot read another descriptor,
        -- so the list is flat rather than a reference. `bundle` is
        -- the name the profile manifest records, which is what
        -- `dsh plugin remove` matches on, and `version` pins the
        -- member so this Agent means one fixed set of bytes.
        members = {
            { name = "dsh-at-file", version = "0.1.0", bundle = "dsh-at-file", commit = "3c8408e8df06ebbd7126d1d7ebcf897ec92a3b86" },
            { name = "dsh-annotation", version = "1.3.13", bundle = "@omdsh-dev/dsh-annotation", commit = "a37edb01c3dbb0b19249cab3b93138ad529281ed" },
            { name = "dsh-notification", version = "0.1.1", bundle = "dsh-notification", commit = "3e33100f51f25f24cece20bfd3d50cfbde0cbca5" },
            { name = "dsh-task-status", version = "0.3.0", bundle = "@dsh-external/dsh-task-status", commit = "4453da02d62289aeb19b046b4d2b5439dd4ce55a" },
        },

        -- Provenance for the expansion above.
        groups = {"group-web-essentials"},

        versions = { ["0.1.0"] = {} },
        latest = "0.1.0",

        needs_build = false,
    },
}
