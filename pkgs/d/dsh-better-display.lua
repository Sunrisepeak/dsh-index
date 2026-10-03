package = {
    spec = "1",

    name = "dsh-better-display",
    description = "A calmer reading view for DeepSeek Harness: native process details, live reasoning, and clean final answers.",
    repo = "https://github.com/aa2246740/dsh-better-display",
    homepage = "https://github.com/aa2246740/dsh-better-display",
    authors = {"aa2246740"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-better-display",

        versions = {
            ["0.1.0"] = { commit = "197817bcc513502d2f939f597b5b5a946994cf72" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
