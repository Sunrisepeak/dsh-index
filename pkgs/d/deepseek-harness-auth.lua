package = {
    spec = "1",

    name = "deepseek-harness-auth",
    description = "DeepSeek Harness auth插件",
    repo = "https://github.com/taichuy/deepseek-harness-auth",
    homepage = "https://github.com/taichuy/deepseek-harness-auth",
    licenses = {"Apache-2.0"},
    authors = {"taichuy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-auth",

        versions = {
            ["0.4.1"] = { commit = "4464052fc1dcae45622cfcef6f9cbbbaaa6004a6" },
        },
        latest = "0.4.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
