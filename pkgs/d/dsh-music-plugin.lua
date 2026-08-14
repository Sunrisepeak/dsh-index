package = {
    spec = "1",

    name = "dsh-music-plugin",
    description = "DeepSeek Harness music plugin (dsh-plugin)",
    repo = "https://github.com/syy-shark/dsh-music-plugin",
    homepage = "https://github.com/syy-shark/dsh-music-plugin",
    licenses = {"MIT"},
    authors = {"syy-shark"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-music-plugin",

        versions = {
            ["0.1.0"] = { commit = "9397ed7fae64303b5f4fdd32d38ba89db5ea135e" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
