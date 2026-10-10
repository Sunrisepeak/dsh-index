package = {
    spec = "1",

    name = "dsh-notify-me",
    description = "DSH 桌面消息提醒插件 / desktop notification and message alerts for DeepSeek Harness web：需要你操作（可操作提醒）与回复完成提醒，系统通知+提示音+标签页标题，设置页开关 + 中英通知语言",
    repo = "https://github.com/chromoany/dsh-notify-me",
    homepage = "https://github.com/chromoany/dsh-notify-me",
    licenses = {"MIT"},
    authors = {"chromoany"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-notify-me",

        versions = {
            ["1.5.3"] = { commit = "8f836ad1aeade0c6092561f66e7bf8d73d5cd2f1" },
        },
        latest = "1.5.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
