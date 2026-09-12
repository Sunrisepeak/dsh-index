package = {
    spec = "1",

    name = "dsh-gitbash-preset",
    description = "DeepSeek Harness 插件：一键安装「极简模式 (Git Bash)」agent preset —— 把 DSH 自带极简模式中的 bash 调用映射到 Git for Windows 的 bash（MSYS），让 Windows 上的极简模式真正可用。",
    repo = "https://github.com/liceses/dsh-gitbash-preset",
    homepage = "https://github.com/liceses/dsh-gitbash-preset",
    licenses = {"MIT"},
    authors = {"liceses"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@icelily/dsh-gitbash-preset",

        versions = {
            ["0.1.1"] = { commit = "fc475f4836ed9ea45b5c624878fdc3acf9e598c6" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
