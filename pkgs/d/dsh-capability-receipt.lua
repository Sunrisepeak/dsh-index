package = {
    spec = "1",

    name = "dsh-capability-receipt",
    description = "Content-addressed receipts for skills actually loaded by DeepSeek Harness",
    repo = "https://github.com/dongsheng123132/dsh-capability-receipt",
    homepage = "https://github.com/dongsheng123132/dsh-capability-receipt",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "capability-proof",

        bundle_name = "dsh-capability-receipt",

        versions = {
            ["0.2.0"] = { commit = "5ede086782016af6068a6f2afbe3bff7f0da2877" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
