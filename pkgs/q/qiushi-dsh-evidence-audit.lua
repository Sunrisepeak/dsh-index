package = {
    spec = "1",

    name = "qiushi-dsh-evidence-audit",
    description = "Observe-only hash-chained evidence receipts for DeepSeek Harness",
    repo = "https://github.com/030611/qiushi-dsh-evidence-audit",
    homepage = "https://github.com/030611/qiushi-dsh-evidence-audit",
    licenses = {"MIT"},
    authors = {"030611"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "qiushi-dsh-evidence-audit",

        versions = {
            ["0.1.0"] = { commit = "94fae130b2845309e1dcabac14696fddb18f8f3a" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
