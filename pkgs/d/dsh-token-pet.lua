package = {
    spec = "1",

    name = "dsh-token-pet",
    description = "DeepSeek Harness Desktop 悬浮用量小宠物：12 个正式逐帧动作反馈请求、工具、上下文压缩、归档与提示词增强；展示实时上下文占用、跨会话 Lifetime Ledger、服务商/模型统计和小时 Token 趋势；支持可编辑提示词增强、拖拽缩放、低性能模式与后台增量索引。",
    repo = "https://github.com/Jimmy0123-ux/dsh-token-pet",
    homepage = "https://github.com/Jimmy0123-ux/dsh-token-pet",
    licenses = {"MIT"},
    authors = {"Jimmy0123-ux"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-token-pet",

        versions = {
            ["0.1.1"] = { commit = "9c8cf3e479b55514a0908a665415b4950aa16521" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
