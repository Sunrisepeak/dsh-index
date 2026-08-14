package = {
    spec = "1",

    name = "dsh-narrative-ledger",
    description = "Verifiable narrative state, continuity and character-knowledge ledger for DeepSeek Harness",
    repo = "https://github.com/dongsheng123132/dsh-narrative-ledger",
    homepage = "https://github.com/dongsheng123132/dsh-narrative-ledger",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-narrative-ledger",

        versions = {
            ["0.1.0"] = { commit = "340a38b0505b51b717b20244c597ec9257a33f25" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
