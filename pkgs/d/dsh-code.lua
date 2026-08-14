package = {
    spec = "1",

    name = "dsh-code",
    description = "Claude-Code-style TUI bundle for DeepSeek Harness",
    repo = "https://github.com/UNLINEARITY/dsh-code",
    homepage = "https://github.com/UNLINEARITY/dsh-code",
    licenses = {"MIT"},
    authors = {"UNLINEARITY"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "cli",

        bundle_name = "dsh-code",

        versions = {
            ["0.4.0"] = { commit = "bd23e56d75d3b05c98fa0754396230af358bcf15" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
