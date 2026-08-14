package = {
    spec = "1",

    name = "dsh-verification-receipt",
    description = "Privacy-minimal heuristic per-turn verification summaries for DeepSeek Harness",
    repo = "https://github.com/030611/dsh-verification-receipt",
    homepage = "https://github.com/030611/dsh-verification-receipt",
    licenses = {"MIT"},
    authors = {"030611"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-verification-receipt",

        versions = {
            ["0.1.0"] = { commit = "92f63a9022e1840b147152ae340276ad5ff5d98b" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
