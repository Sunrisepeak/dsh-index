package = {
    spec = "1",

    name = "sandbox-mxc",
    description = "微软跨平台沙盒支持",
    repo = "https://github.com/omdsh-dev/sandbox-mxc",
    homepage = "https://github.com/omdsh-dev/sandbox-mxc",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-sandbox-mxc",
        source = "github",
        origin = "omdsh-dev/sandbox-mxc",

        versions = {
            ["0.0.2"] = { ref = "61ed9e8dd1359d8ccc9c0deeaa4cabaa0e074808" },
        },
        latest = "0.0.2",

        needs_build = true,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
