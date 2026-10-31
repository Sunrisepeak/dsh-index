package = {
    spec = "1",

    name = "dsh-free-models-hub",
    description = "免费模型排行榜 · DeepSeek Harness 社区插件，在 DeepSeek Harness (DSH) Web UI 左侧边栏提供「免费模型榜」：分页浏览（每页 20 条、页码窗口、首页/末页）、 点击标题展开 API 调用地址 / 模型名称 / 【点击这里申请免费密钥key】按钮， 并支持一键配置到 设置 → 模型 → 自定义提供方 —— 用户只需自行粘贴免费 API Key",
    repo = "https://github.com/yu-wenchao/dsh-free-models-hub",
    homepage = "https://github.com/yu-wenchao/dsh-free-models-hub",
    licenses = {"MIT"},
    authors = {"yu-wenchao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-free-models-hub",

        versions = {
            ["0.3.1"] = { commit = "3c98fc5dfba7d69a2b96713739b5bdea99c9b5f4" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
