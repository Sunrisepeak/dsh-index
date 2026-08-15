package = {
    spec = "1",

    name = "dsh-toy",
    description = "Toy Control Protocol for DSH",
    repo = "https://github.com/c3ll256/dsh-toy",
    homepage = "https://github.com/c3ll256/dsh-toy",
    licenses = {"BSD-3-Clause"},
    authors = {"c3ll256"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-toy",

        versions = {
            ["0.2.0"] = { commit = "adece3467506c9e40e1393baca89f20caff20c2c" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
