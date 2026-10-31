package = {
    spec = "1",

    name = "ybkkasi",
    description = "One control plane for every AI asset — MCP servers, skills, agents, AI apps. Self-hosted ledger with lifecycle state machine, 85 permission points, department × agent × skill cost attribution, and audit trail. MIT, zero runtime deps (Node 22 + node:sqlite). 企业 AI 资产治理。",
    repo = "https://github.com/01men/ybkkasi",
    homepage = "https://github.com/01men/ybkkasi",
    licenses = {"MIT"},
    authors = {"01men"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-enterprise-ops",

        versions = {
            ["1.5.0"] = { commit = "d87aa0ba073d0e83fad1249598a57c52c0f1eac4" },
        },
        latest = "1.5.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
