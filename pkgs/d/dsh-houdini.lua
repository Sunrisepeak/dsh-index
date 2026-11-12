package = {
    spec = "1",

    name = "dsh-houdini",
    description = "deepseek harness plugin for houdini. ai agnet for houdini",
    repo = "https://github.com/eee1723/dsh-houdini",
    homepage = "https://github.com/eee1723/dsh-houdini",
    authors = {"eee1723"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-houdini",

        versions = {
            ["0.1.8"] = { commit = "b9b5319128e66953e2416928dc3eb9d5d710c9f3" },
        },
        latest = "0.1.8",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
