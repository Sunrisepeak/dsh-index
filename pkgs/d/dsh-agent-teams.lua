package = {
    spec = "1",

    name = "dsh-agent-teams",
    description = "AgentTeams plugin for DeepSeek Harness",
    repo = "https://github.com/NanmiCoder/dsh-agent-teams",
    homepage = "https://github.com/NanmiCoder/dsh-agent-teams",
    authors = {"NanmiCoder"},

    status = "dev",
    categories = {"dsh-plugin", "workflow"},
    keywords = {"dsh", "agentteams", "deepseekharness", "dsh-agent-teams"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agent-teams",

        versions = {
            ["0.1.8"] = { commit = "801954dd7be67213cf4adc1aeb6f97bd3daa12cc" },
            ["0.1.7"] = { commit = "763d88f0d5060f6009b87764d958e6caa18bade8" },
            ["0.1.6"] = { commit = "00857a1f1a8559f860286ca082e43f796b5e9389" },
            ["0.1.5"] = { commit = "2b1141248f34ee28870d2e39462c0dbefaa5ffdb" },
            ["0.1.2"] = { commit = "00a8329a8fc86322626d47ad3e1a8c0de325cbe7" },
            ["0.1.0"] = { commit = "874654fcaabb1ae16b64503407370c23099f33b9" },
        },
        latest = "0.1.8",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
