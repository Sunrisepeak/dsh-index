package = {
    spec = "1",

    name = "dsh-anchored-monitor",
    description = "Real-time chain-of-thought anchoring monitor & intervention plugin for DeepSeek Harness: three-band (spec/mixed/react) fingerprint detection, L1 hint / L2 reset / L3 restart interventions, liquid-glass web overlay + rheostat bar, standalone monitor process with JSONL experiment logs.",
    repo = "https://github.com/Aik358/dsh-anchored-monitor",
    homepage = "https://github.com/Aik358/dsh-anchored-monitor",
    licenses = {"MIT"},
    authors = {"Aik358"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@a9i5k4/dsh-anchored-monitor",

        versions = {
            ["0.3.0"] = { commit = "8cb863fa50c3d17dec2683a247b93f90deeb5a16" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
