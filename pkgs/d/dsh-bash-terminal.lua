package = {
    spec = "1",

    name = "dsh-bash-terminal",
    description = "dsh-bash-terminal",
    repo = "https://github.com/MAXeaglet/dsh-bash-terminal",
    homepage = "https://github.com/MAXeaglet/dsh-bash-terminal",
    licenses = {"MIT"},
    authors = {"MAXeaglet"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-bash-terminal",

        versions = {
            ["0.3.14"] = { commit = "6894913d71098f2ea24120d3a1afd5771f9ccd4a" },
        },
        latest = "0.3.14",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
