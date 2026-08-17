package = {
    spec = "1",

    name = "deepseek-plugin-store",
    description = "DeepSeek Harness 独立社区插件商店：发现、安装并提交经过验证的插件、工具与扩展。 | Independent community plugin directory.",
    repo = "https://github.com/Ericwong5021/deepseek-plugin-store",
    homepage = "https://github.com/Ericwong5021/deepseek-plugin-store",
    licenses = {"CC0-1.0"},
    authors = {"Ericwong5021"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-plugin-store",

        versions = {
            ["0.2.0"] = { commit = "274a4d8d202482da942995ce176998fa636ac3de" },
            ["0.1.1"] = { commit = "c4f438fdb7b2599c86041381ea2e97f9091b5c6d" },
            ["0.1.0"] = { commit = "bb0565016ada8e766cac08fd985a7dae65c4a1c6" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
