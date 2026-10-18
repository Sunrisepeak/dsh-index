package = {
    spec = "1",

    name = "dsh-chatgpt-sub",
    description = "ChatGPT Subscription - a DeepSeek Harness plugin: bind your ChatGPT account via official OAuth and chat with ChatGPT models inside DSH, using your Plus/Pro subscription quota",
    repo = "https://github.com/songoao25/dsh-chatgpt-sub",
    homepage = "https://github.com/songoao25/dsh-chatgpt-sub",
    licenses = {"MIT"},
    authors = {"songoao25"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-chatgpt-sub",

        versions = {
            ["0.6.3"] = { commit = "2c13fe53569506ff5a0b509b31d39f73aba627a0" },
        },
        latest = "0.6.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
