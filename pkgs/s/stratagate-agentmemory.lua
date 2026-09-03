package = {
    spec = "1",

    name = "stratagate-agentmemory",
    description = "Local-first cross-session memory for DeepSeek Harness (DSH): automatic capture, Event/Element cards, evidence-gated recall, source tracing. 本地跨会话长期记忆。",
    repo = "https://github.com/diqierjia/StrataGate-AgentMemory",
    homepage = "https://github.com/diqierjia/StrataGate-AgentMemory",
    licenses = {"MIT"},
    authors = {"diqierjia"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "stratagate-dsh",

        versions = {
            ["0.2.47"] = { commit = "57003eeac27b129826d6e40e6088559b2b04f817" },
        },
        latest = "0.2.47",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
