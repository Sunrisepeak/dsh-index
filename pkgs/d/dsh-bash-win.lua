package = {
    spec = "1",

    name = "dsh-bash-win",
    description = "在 Windows 环境中为 DeepSeek Harness 提供 Git Bash 与 WSL 2 bash 工具,含 bwrap 沙箱、审批模式、后台任务",
    repo = "https://github.com/zimzaza4/dsh-bash-win",
    homepage = "https://github.com/zimzaza4/dsh-bash-win",
    licenses = {"MIT"},
    authors = {"zimzaza4"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zimzaza4/dsh-bash-win",

        versions = {
            ["0.1.1"] = { commit = "814574a80b31d9de4eb09709dac0230cf4e3ba56" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
