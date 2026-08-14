package = {
    spec = "1",

    name = "deepseek-harness-qqbot",
    description = "QQ Bot text and image channel plugin for DeepSeek Harness",
    repo = "https://github.com/sliverp/DeepSeek-harness-qqbot",
    homepage = "https://github.com/sliverp/DeepSeek-harness-qqbot",
    licenses = {"MIT"},
    authors = {"sliverp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-qqbot",

        versions = {
            ["0.1.3"] = { commit = "1b9f375584f0e5fdb26038c42f623cf3ebdf3104" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
