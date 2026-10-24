package = {
    spec = "1",

    name = "dsh-change-review",
    description = "DeepSeek Harness 会话修改审查插件：追踪会话内 write/edit，diff 对比展示，会话隔离/子代理聚合/SSE 实时推送/颜色自定义",
    repo = "https://github.com/cirelir/dsh-change-review",
    homepage = "https://github.com/cirelir/dsh-change-review",
    licenses = {"MIT"},
    authors = {"cirelir"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-change-review",

        versions = {
            ["0.3.0"] = { commit = "1f2de55b3f95dd1c513e713fe56664648ca2e447" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
