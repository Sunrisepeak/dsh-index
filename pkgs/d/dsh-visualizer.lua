package = {
    spec = "1",

    name = "dsh-visualizer",
    description = "dsh-visualizer",
    repo = "https://github.com/abiddotdev/dsh-visualizer",
    homepage = "https://github.com/abiddotdev/dsh-visualizer",
    licenses = {"MIT"},
    authors = {"abiddotdev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "visualizer",

        bundle_name = "dsh-visualizer",

        versions = {
            ["0.9.0"] = { commit = "af61080a04babd75feb7dc8eac0986b266ea8fdb" },
        },
        latest = "0.9.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
