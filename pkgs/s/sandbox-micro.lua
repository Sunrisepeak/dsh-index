package = {
    spec = "1",

    name = "sandbox-micro",
    description = "microsandbox支持",
    repo = "https://github.com/omdsh-dev/sandbox-micro",
    homepage = "https://github.com/omdsh-dev/sandbox-micro",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "sandbox"},
    keywords = {"dsh", "sandbox"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@deepseek-ai/dsh-sandbox-microsandbox",

        versions = {
            ["0.0.2"] = { commit = "ebc8be539a4ed4e66157d1f8255c58a4db4e4dc4" },
        },
        latest = "0.0.2",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
