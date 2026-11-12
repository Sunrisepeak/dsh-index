package = {
    spec = "1",

    name = "unity-plugin",
    description = "DeepSeek Harness plugin: control the Unity Editor through the unity CLI",
    repo = "https://github.com/opdsh/unity-plugin",
    homepage = "https://github.com/opdsh/unity-plugin",
    licenses = {"MIT"},
    authors = {"opdsh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@opdsh/unity-plugin",

        versions = {
            ["0.1.5"] = { commit = "c71dea5fedada95f1931f07b0fc355a54d6ae575" },
        },
        latest = "0.1.5",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
