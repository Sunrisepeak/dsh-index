package = {
    spec = "1",

    name = "dsh-xai",
    description = "xAI Grok SuperGrok / X Premium OAuth for DeepSeek Harness",
    repo = "https://github.com/MirDie/dsh-xai",
    homepage = "https://github.com/MirDie/dsh-xai",
    authors = {"MirDie"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-xai",

        versions = {
            ["0.1.0"] = { commit = "5946301f992b7445d8dcb26bd9c89dc86246832b" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
