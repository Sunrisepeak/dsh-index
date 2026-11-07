package = {
    spec = "1",

    name = "dsh-bridge",
    description = "DeepSeek Harness 多通道远程访问插件 | 手机扫码秒连本地 AI、微信/QQ 直接对话、流式输出、按钮交互、多工作区切换、会话持久化 | 无需公网服务器，支持局域网直连、Cloudflare 隧道、自建隧道 | QQ Bot  + 微信 ClawBot",
    repo = "https://github.com/wenbin-wb/dsh-bridge",
    homepage = "https://github.com/wenbin-wb/dsh-bridge",
    licenses = {"MIT"},
    authors = {"wenbin-wb"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@wenbin_wb/dsh-bridge",

        versions = {
            ["2.2.6"] = { commit = "848dcba7edd44c37c8513be9bb5d52f5bf2f2cd7" },
        },
        latest = "2.2.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
