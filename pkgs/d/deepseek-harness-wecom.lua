package = {
    spec = "1",

    name = "deepseek-harness-wecom",
    description = "WeCom AI Bot text and image bridge for DeepSeek Harness",
    repo = "https://github.com/sliverp/DeepSeek-harness-wecom",
    homepage = "https://github.com/sliverp/DeepSeek-harness-wecom",
    licenses = {"MIT"},
    authors = {"sliverp"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-wecom",

        versions = {
            ["0.1.4"] = { commit = "0887563d15bf4d43a5a4c5101e91aecdc3d321f3" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
