package = {
    spec = "1",

    name = "sandbox-mxc",
    description = "微软跨平台沙盒支持",
    repo = "https://github.com/omdsh-dev/sandbox-mxc",
    homepage = "https://github.com/omdsh-dev/sandbox-mxc",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "sandbox"},
    keywords = {"dsh", "sandbox"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-sandbox-mxc",

        versions = {
            ["0.0.2"] = { commit = "61ed9e8dd1359d8ccc9c0deeaa4cabaa0e074808" },
        },
        latest = "0.0.2",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
