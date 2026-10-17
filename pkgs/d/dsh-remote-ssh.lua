package = {
    spec = "1",

    name = "dsh-remote-ssh",
    description = "DSH web plugin: VSCode Remote-SSH-like remote development (SSH, remote workspace, file explorer, integrated terminal)",
    repo = "https://github.com/ZhangFengshun/dsh-remote-ssh",
    homepage = "https://github.com/ZhangFengshun/dsh-remote-ssh",
    licenses = {"MIT"},
    authors = {"ZhangFengshun"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zhangfengshun/dsh-remote-ssh",

        versions = {
            ["2.4.7"] = { commit = "a6fe61ccc967b85ba06b07a3a28c63760c48ffa2" },
        },
        latest = "2.4.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
