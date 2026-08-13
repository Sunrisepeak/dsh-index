package = {
    spec = "1",

    name = "dsh-agent-teams",
    description = "AgentTeams plugin for DeepSeek Harness",
    repo = "https://github.com/NanmiCoder/dsh-agent-teams",
    homepage = "https://github.com/NanmiCoder/dsh-agent-teams",
    authors = {"NanmiCoder"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-agent-teams",
        source = "github",
        origin = "NanmiCoder/dsh-agent-teams",

        versions = {
            ["0.1.0"] = { ref = "874654fcaabb1ae16b64503407370c23099f33b9" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
