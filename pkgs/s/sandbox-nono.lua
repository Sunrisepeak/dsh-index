package = {
    spec = "1",

    name = "sandbox-nono",
    description = "nono沙盒支持",
    repo = "https://github.com/omdsh-dev/sandbox-nono",
    homepage = "https://github.com/omdsh-dev/sandbox-nono",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-sandbox-nono",
        source = "github",
        origin = "omdsh-dev/sandbox-nono",

        versions = {
            ["0.0.2"] = { ref = "d8e1b7914db70d4799e3c4ad279b609d45a6aa44" },
        },
        latest = "0.0.2",

        needs_build = true,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
