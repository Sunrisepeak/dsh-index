package = {
    spec = "1",

    name = "dsh-session-audit",
    description = "Session execution analytics and audit reports for DeepSeek Harness — see how your agent actually worked",
    repo = "https://github.com/bwndlct/dsh-session-audit",
    homepage = "https://github.com/bwndlct/dsh-session-audit",
    licenses = {"MIT"},
    authors = {"bwndlct"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-audit",

        versions = {
            ["0.2.0"] = { commit = "7f1d90e70fc628e602bc5cff531183a37ef6cae2" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
