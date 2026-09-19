package = {
    spec = "1",

    name = "dsh-wsl-workspace",
    description = "WSL workspace support for DeepSeek Harness——无缝的 WSL 工作区使用体验，无需在 WSL 之中再安装一个dsh，安装该插件后在 GUI 里直接添加 WSL 工作区即可。WSL workspace support for DeepSeek Harness — Enjoy a seamless WSL workspace experience without needing to install dsh inside WSL. Once this plugin is installed, you can directly add a WSL workspace right from the GUI.",
    repo = "https://github.com/6Mikao9/dsh-wsl-workspace",
    homepage = "https://github.com/6Mikao9/dsh-wsl-workspace",
    licenses = {"MIT"},
    authors = {"6Mikao9"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-wsl-workspace",

        versions = {
            ["0.2.3"] = { commit = "3861bd984c3877cfca71fb51f81e688e0ef7f238" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
