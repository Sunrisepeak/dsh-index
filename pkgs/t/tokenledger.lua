package = {
    spec = "1",

    name = "tokenledger",
    description = "Relay-site attributed token usage for DeepSeek Harness — zero config, no credentials",
    repo = "https://github.com/zh667/TokenLedger",
    homepage = "https://github.com/zh667/TokenLedger",
    licenses = {"MIT"},
    authors = {"zh667"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tokenledger",

        versions = {
            ["0.1.0"] = { commit = "f3e3b777ede082e825503c1458b61de732ddb0d6" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
