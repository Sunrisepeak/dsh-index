package = {
    spec = "1",

    name = "dsh-cyber-particle",
    description = "为 DeepSeek Harness Web 界面添加动态粒子网络背景 | Particle-network background plugin for DeepSeek Harness web",
    repo = "https://github.com/AKS1st/dsh-cyber-particle",
    homepage = "https://github.com/AKS1st/dsh-cyber-particle",
    licenses = {"MIT"},
    authors = {"AKS1st"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "cyber-particle",

        versions = {
            ["0.2.3"] = { commit = "e08111d59df009454d9de6b8384907f697e038f6" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
