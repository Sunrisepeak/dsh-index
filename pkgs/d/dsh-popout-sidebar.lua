package = {
    spec = "1",

    name = "dsh-popout-sidebar",
    description = "A sidebar can pop out a separate browser tab (drag it to another monitor)",
    repo = "https://github.com/e2mcc/dsh-popout-sidebar",
    homepage = "https://github.com/e2mcc/dsh-popout-sidebar",
    licenses = {"MIT"},
    authors = {"e2mcc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-popout-sidebar",

        versions = {
            ["1.0.0"] = { commit = "4598b1d4baf3224f313dd931ca2b0cfc09600679" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
