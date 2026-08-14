package = {
    spec = "1",

    name = "dsh-web-attention-badge",
    description = "Attention reminders for the DeepSeek Harness Web UI: frame badge, (N) tab title and whale-favicon recolor for sessions waiting for input or finished unopened.",
    repo = "https://github.com/Luaphes/dsh-web-attention-badge",
    homepage = "https://github.com/Luaphes/dsh-web-attention-badge",
    licenses = {"MIT"},
    authors = {"Luaphes"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-attention-badge",

        versions = {
            ["0.3.2"] = { commit = "8b2ede6ccda65da20d57e5e1af995aa9e089dc04" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
