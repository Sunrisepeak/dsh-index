package = {
    spec = "1",

    name = "qwen-mm-plugins",
    description = "Qwen-MM-Plugins支持",
    repo = "https://github.com/omdsh-dev/Qwen-MM-Plugins",
    homepage = "https://github.com/omdsh-dev/Qwen-MM-Plugins",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "qwen"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-qwen-mm",

        versions = {
            ["0.0.2"] = { commit = "a03d50556272ca7e7383673c3913c6718ab8d622" },
        },
        latest = "0.0.2",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
