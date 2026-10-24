package = {
    spec = "1",

    name = "deepseek-harness-genui",
    description = "Code-first generative UI for DeepSeek Harness",
    repo = "https://github.com/pengyue-polaron/deepseek-harness-genui",
    homepage = "https://github.com/pengyue-polaron/deepseek-harness-genui",
    licenses = {"MIT"},
    authors = {"pengyue-polaron"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-genui",

        versions = {
            ["0.12.2"] = { commit = "0466f31b635bcc438ba6488926d69f33277dd94c" },
        },
        latest = "0.12.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
