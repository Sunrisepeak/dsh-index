package = {
    spec = "1",

    name = "dsh-lark-bridge",
    description = "Bidirectional Lark/Feishu controller for DeepSeek Harness",
    repo = "https://github.com/imetn/dsh-lark-bridge",
    homepage = "https://github.com/imetn/dsh-lark-bridge",
    licenses = {"MIT"},
    authors = {"imetn"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "lark",

        bundle_name = "dsh-lark-bridge",

        versions = {
            ["0.1.0"] = { commit = "f1e544cce5108873e238313bf7c5ccf092827e2a" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
