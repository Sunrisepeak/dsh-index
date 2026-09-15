package = {
    spec = "1",

    name = "api-relay-audit",
    description = "Local security audit for AI API relays and LLM proxies: detects prompt injection, model substitution, tool-call rewriting, SSE anomalies, error leakage, and Web3 wallet risks.",
    repo = "https://github.com/toby-bridges/api-relay-audit",
    homepage = "https://github.com/toby-bridges/api-relay-audit",
    licenses = {"AGPL-3.0"},
    authors = {"toby-bridges"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web3",

        bundle_name = "dsh-api-relay-audit",

        versions = {
            ["2.4.0"] = { commit = "00ce80208ea1178ac39116bf0843517a748e4dce" },
        },
        latest = "2.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
