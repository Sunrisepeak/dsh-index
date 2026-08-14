package = {
    spec = "1",

    name = "dsh-slack",
    description = "DeepSeek Harness Slack 插件：slack_notify/channels/inbox/reply 四工具，Socket Mode 免公网回调收消息，收件箱队列 + 线程回复，支持自定义 slackApiUrl 对接代理网关；内置假 Slack 服务器做协议级验收测试。· Two-way Slack messaging for DeepSeek Harness agents.",
    repo = "https://github.com/STARDUSTLC666/dsh-slack",
    homepage = "https://github.com/STARDUSTLC666/dsh-slack",
    authors = {"STARDUSTLC666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-slack",

        versions = {
            ["0.2.1"] = { commit = "da3db42ea3e5573ac3ec044670baee866cdcffe3" },
        },
        latest = "0.2.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
