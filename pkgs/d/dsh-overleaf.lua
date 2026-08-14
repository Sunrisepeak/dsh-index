package = {
    spec = "1",

    name = "dsh-overleaf",
    description = "Connect Overleaf projects to DeepSeek Harness (DSH) through OverleafMCP and MCP tools.",
    repo = "https://github.com/fly233338/dsh-overleaf",
    homepage = "https://github.com/fly233338/dsh-overleaf",
    licenses = {"MIT"},
    authors = {"fly233338"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-overleaf",

        versions = {
            ["0.1.0"] = { commit = "9f2e7be9a211323af4e92553e777af9c7d33abfc" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
