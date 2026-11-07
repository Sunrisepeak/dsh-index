package = {
    spec = "1",

    name = "dsh-email",
    description = "DSH 邮件工作台：多账号收发、图文阅读、IMAP 废纸篓与撤销、草稿预览和确认发送。欢迎提交 issues 和 PR。",
    repo = "https://github.com/STARDUSTLC666/dsh-email",
    homepage = "https://github.com/STARDUSTLC666/dsh-email",
    licenses = {"MIT"},
    authors = {"STARDUSTLC666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-email",

        versions = {
            ["0.22.1"] = { commit = "2ec4278a3c3e5a5ee6133ee1ead0603c42f39681" },
        },
        latest = "0.22.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
