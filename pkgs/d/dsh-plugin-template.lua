package = {
    spec = "1",

    name = "dsh-plugin-template",
    description = "Template for deepseek-harness plugin development.",
    repo = "https://github.com/bugmaker2/dsh-plugin-template",
    homepage = "https://github.com/bugmaker2/dsh-plugin-template",
    licenses = {"MIT"},
    authors = {"bugmaker2"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "hello",

        bundle_name = "dsh-plugin-template",

        versions = {
            ["0.1.0"] = { commit = "114f75999d8d477951cbd91ee4d1e0f5360d6627" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
