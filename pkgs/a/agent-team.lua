package = {
    spec = "1",

    name = "agent-team",
    description = "Multi-agent team collaboration for DeepSeek Harness, with independent models, skills, MCP tools, contexts, and a shared workspace.",
    repo = "https://github.com/limuyang2/agent-team",
    homepage = "https://github.com/limuyang2/agent-team",
    licenses = {"MIT"},
    authors = {"limuyang2"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@limuyang2/dsh-agent-team",

        versions = {
            ["0.1.3"] = { commit = "a538d18c6430603708625186db40c57044324f30" },
        },
        latest = "0.1.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
