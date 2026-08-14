package = {
    spec = "1",

    name = "dsh-beacons",
    description = "Right-edge prompt navigator (Codex/OpenChamber-style scrub rail with scroll-spy) plus Windows toast notifications — a DeepSeek Harness plugin",
    repo = "https://github.com/Da-Mie/dsh-beacons",
    homepage = "https://github.com/Da-Mie/dsh-beacons",
    licenses = {"MIT"},
    authors = {"Da-Mie"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-beacons",

        versions = {
            ["0.1.0"] = { commit = "9c75e90bf08ed3b78fdf5023d7fc6e9141f3bc13" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
