package = {
    spec = "1",

    name = "dsh-action-parity",
    description = "Cross-surface action binding and replay parity evidence for DeepSeek Harness",
    repo = "https://github.com/dongsheng123132/dsh-action-parity",
    homepage = "https://github.com/dongsheng123132/dsh-action-parity",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-action-parity",

        versions = {
            ["0.1.0"] = { commit = "2820860ae3d80fb04382d13e11be0b5270929dbb" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
