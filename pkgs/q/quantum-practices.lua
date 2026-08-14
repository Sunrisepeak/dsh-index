package = {
    spec = "1",

    name = "quantum-practices",
    description = "Quantum Algorithms Best Practices",
    repo = "https://github.com/unitarylab/quantum-practices",
    homepage = "https://github.com/unitarylab/quantum-practices",
    authors = {"unitarylab"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "dsh-unitarylab-quantum-practices",

        versions = {
            ["0.1.0"] = { commit = "572a24c9b5c9787caec98810351f5cb17c82250e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
