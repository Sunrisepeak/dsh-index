package = {
    spec = "1",

    name = "dsh-default-workspace-plugin",
    description = "dsh-default-workspace-plugin",
    repo = "https://github.com/fenxin-fx/dsh-default-workspace-plugin",
    homepage = "https://github.com/fenxin-fx/dsh-default-workspace-plugin",
    licenses = {"MIT"},
    authors = {"fenxin-fx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-default-workspace",

        versions = {
            ["0.2.0"] = { commit = "a5fcdd6714a243c40e88611b12131c36d051871c" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
