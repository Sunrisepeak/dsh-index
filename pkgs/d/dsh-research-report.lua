package = {
    spec = "1",

    name = "dsh-research-report",
    description = "Verifiable research-report engine for DeepSeek Harness: content-addressed evidence ledger (claim-snapshot binding, tamper-evident) plus versioned sealed reports with per-claim verification verdicts and a manifest-sealed directory.",
    repo = "https://github.com/PerryLink/dsh-research-report",
    homepage = "https://github.com/PerryLink/dsh-research-report",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-research-report",

        versions = {
            ["0.3.0"] = { commit = "3e7b98e941ad77bd6c4802e8c91600719fa3c455" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
