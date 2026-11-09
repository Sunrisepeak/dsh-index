package = {
    spec = "1",

    name = "dsh-language-bridge",
    description = "DeepSeek Harness plugin: per-model working languages, with DeepSeek translating prompts and replies",
    repo = "https://github.com/tonyzdev/dsh-language-bridge",
    homepage = "https://github.com/tonyzdev/dsh-language-bridge",
    licenses = {"MIT"},
    authors = {"tonyzdev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-language-bridge",

        versions = {
            ["2.0.0"] = { commit = "05870be361c87d865d311f4e1bcf4a492dadeef7" },
        },
        latest = "2.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
