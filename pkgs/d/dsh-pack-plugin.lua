package = {
    spec = "1",

    name = "dsh-pack-plugin",
    description = "dsh-pack-plugin",
    repo = "https://github.com/DSH-PackForge/dsh-pack-plugin",
    homepage = "https://github.com/DSH-PackForge/dsh-pack-plugin",
    licenses = {"MIT"},
    authors = {"DSH-PackForge"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-packforge/dsh-pack-plugin",

        versions = {
            ["0.3.5"] = { commit = "7c87e8620d9097b7e18f96769af4b3edd98031db" },
        },
        latest = "0.3.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
