package = {
    spec = "1",

    name = "dsh-catppuccin",
    description = "DeepSeek Harness Web GUI 的 Catppuccin 主题插件：Latte / Frappé / Macchiato / Mocha 四种风味一键切换",
    repo = "https://github.com/NoNameLeGo/dsh-catppuccin",
    homepage = "https://github.com/NoNameLeGo/dsh-catppuccin",
    licenses = {"MIT"},
    authors = {"NoNameLeGo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-catppuccin",

        versions = {
            ["0.1.0"] = { commit = "f314b224bf61a68a79e147c583069a451a85c1fb" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
