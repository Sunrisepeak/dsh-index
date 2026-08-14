package = {
    spec = "1",

    name = "dsh-email",
    description = "DeepSeek Harness 邮件插件：email_list/read/search/send/folders/attachment 六工具，内置 QQ/163/126/新浪/阿里/Gmail/Outlook/iCloud 八个预设，多账号、附件收发、Web 设置页配置，纯 Node 全平台。· IMAP/SMTP email tools for DeepSeek Harness agents.",
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
        profile = "web",

        bundle_name = "dsh-email",

        versions = {
            ["0.6.0"] = { commit = "d823780270a107a62a12509786acc63831ca37d9" },
        },
        latest = "0.6.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
