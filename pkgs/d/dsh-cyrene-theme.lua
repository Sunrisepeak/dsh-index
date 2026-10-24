package = {
    spec = "1",

    name = "dsh-cyrene-theme",
    description = "Cyrene theme dsh plugin",
    repo = "https://github.com/berhbro/dsh-cyrene-theme",
    homepage = "https://github.com/berhbro/dsh-cyrene-theme",
    licenses = {"MIT"},
    authors = {"berhbro"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-cyrene-theme",

        versions = {
            ["0.2.0"] = { commit = "dda6092e53c5b9f0897813ea419d6b313219317c" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
