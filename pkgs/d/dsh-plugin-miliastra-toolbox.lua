package = {
    spec = "1",

    name = "dsh-plugin-miliastra-toolbox",
    description = "将千星沙箱（原神千星奇域）知识库接入 Deepseek Harness 的插件",
    repo = "https://github.com/1475505/dsh-plugin-miliastra-toolbox",
    homepage = "https://github.com/1475505/dsh-plugin-miliastra-toolbox",
    authors = {"1475505"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-miliastra-toolbox",

        versions = {
            ["0.1.0"] = { commit = "f35d55c1109bb7d822e48b22695335278e7208bc" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
