package = {
    spec = "1",

    name = "dsh-cost",
    description = "Evidence-first token cost ledger and budget checks for DeepSeek Harness",
    repo = "https://github.com/dongsheng123132/dsh-cost",
    homepage = "https://github.com/dongsheng123132/dsh-cost",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-cost",

        versions = {
            ["0.2.0"] = { commit = "849d81509b334b42ddd8032cd8f5377758fc34c3" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
