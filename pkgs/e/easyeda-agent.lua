package = {
    spec = "1",

    name = "easyeda-agent",
    description = "easyeda-agent",
    repo = "https://github.com/zhoushoujianwork/easyeda-agent",
    homepage = "https://github.com/zhoushoujianwork/easyeda-agent",
    authors = {"zhoushoujianwork"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "easyeda-agent-dsh",

        versions = {
            ["0.25.1"] = { commit = "34322a7e3b19e59f9e24c5f981fb094f8232f778" },
        },
        latest = "0.25.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
