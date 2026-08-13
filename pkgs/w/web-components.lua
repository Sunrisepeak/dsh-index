package = {
    spec = "1",

    name = "web-components",
    description = "web-components支持",
    repo = "https://github.com/omdsh-dev/web-components",
    homepage = "https://github.com/omdsh-dev/web-components",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "web", "components"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-client-web-component",
        source = "github",
        origin = "omdsh-dev/web-components",

        versions = {
            ["0.0.2"] = { ref = "6d6f77aaf881a78b45c6ec6593b9db8788abcef4" },
        },
        latest = "0.0.2",

        needs_build = true,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
