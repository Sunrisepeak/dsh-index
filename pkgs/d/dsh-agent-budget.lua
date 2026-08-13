package = {
    spec = "1",

    name = "dsh-agent-budget",
    description = "Native Harness agent-tree token budget plugin",
    repo = "https://github.com/vibeinging/dsh-agent-budget",
    homepage = "https://github.com/vibeinging/dsh-agent-budget",
    authors = {"vibeinging"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-agent-budget",
        source = "github",
        origin = "vibeinging/dsh-agent-budget",

        versions = {
            ["0.0.1"] = { ref = "2702e6d4846d478c01ff09ccbb54fc9f6313daba" },
        },
        latest = "0.0.1",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
