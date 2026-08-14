package = {
    spec = "1",

    name = "dsh-balance-meter",
    description = "DeepSeek account balance and session cost readout for the DeepSeek Harness Web GUI",
    repo = "https://github.com/Ghost011118/dsh-balance-meter",
    homepage = "https://github.com/Ghost011118/dsh-balance-meter",
    licenses = {"BSD-3-Clause"},
    authors = {"Ghost011118"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-balance-meter",

        versions = {
            ["0.1.0"] = { commit = "db97c0ea49767d7e73166d8d57a13e54970533e4" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
