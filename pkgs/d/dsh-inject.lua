package = {
    spec = "1",

    name = "dsh-inject",
    description = "Advanced model-context injection and request-only rewriting for DeepSeek Harness with native Keysmith rules compatibility.",
    repo = "https://github.com/john-walks-slow/dsh-inject",
    homepage = "https://github.com/john-walks-slow/dsh-inject",
    licenses = {"MIT"},
    authors = {"john-walks-slow"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-inject",

        versions = {
            ["0.3.2"] = { commit = "e5a434e5ffb5bd6d1fb57c6c28d37b2b12831533" },
        },
        latest = "0.3.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
