package = {
    spec = "1",

    name = "stent",
    description = "灵感来源于MC Fabric的Cordis/DSH hook处理器",
    repo = "https://github.com/omdsh-dev/stent",
    homepage = "https://github.com/omdsh-dev/stent",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@oh-my-dsh/stent-pack",

        versions = {
            ["0.1.1"] = { commit = "349c95891a43ee3f78adf672a514ce44a75646bc" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
