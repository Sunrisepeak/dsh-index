package = {
    spec = "1",

    name = "dsh-dingtalk",
    description = "DeepSeek Harness 钉钉群机器人通知插件：dingtalk_notify/dingtalk_text 两工具，自定义机器人 webhook + HMAC 加签安全模式，手写签名实现、零运行时依赖；纯 Node 全平台。· DingTalk group-robot notifications for DeepSeek Harness agents.",
    repo = "https://github.com/STARDUSTLC666/dsh-dingtalk",
    homepage = "https://github.com/STARDUSTLC666/dsh-dingtalk",
    authors = {"STARDUSTLC666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-dingtalk",

        versions = {
            ["0.1.1"] = { commit = "8922305c02ce3d717d561ef7783a17d73a021df1" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
