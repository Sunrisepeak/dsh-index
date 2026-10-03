package = {
    spec = "1",

    name = "dsh-catppuccin-theme",
    description = "DeepSeek Harness Web GUI 的 Catppuccin 主题插件：Latte / Frappé / Macchiato / Mocha 四种主题一键切换，内置可开关的玻璃质感（Glassmorphism）",
    repo = "https://github.com/NoNameLeGo/dsh-catppuccin-theme",
    homepage = "https://github.com/NoNameLeGo/dsh-catppuccin-theme",
    licenses = {"MIT"},
    authors = {"NoNameLeGo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@nonamelego/dsh-catppuccin",

        versions = {
            ["0.2.1"] = { commit = "8bb3d0df49e0e85589880e59238743aa4d21dc2a" },
        },
        latest = "0.2.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
