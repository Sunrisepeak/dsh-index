package = {
    spec = "1",

    name = "dsh-blue-whale",
    description = "Official DeepSeek Chat blue-whale default skin for DeepSeek Harness",
    repo = "https://github.com/starslittle/dsh-blue-whale",
    homepage = "https://github.com/starslittle/dsh-blue-whale",
    licenses = {"MIT"},
    authors = {"starslittle"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-blue-whale",

        versions = {
            ["0.1.0"] = { commit = "3ac1721bb1bc3a3929f0d70d42ec9e0c3ff81325" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
