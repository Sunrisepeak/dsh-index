package = {
    spec = "1",

    name = "awesome-dsh-background-plugin",
    description = "DSH Web 背景个性化插件：上传自己的图片（JPG / PNG / WEBP / GIF，浏览器端自动压缩到 1600px 以内）或一键切换极光、余烬、宣纸三种预设氛围；实时预览所见即所得，支持细调图像存在感、暗色遮罩、柔焦、适配方式与焦点位置；上传即自动保存到 DSH 设置，重启后原样恢复，浅色 / 深色主题均正常；侧栏、消息气泡、输入框保持原样不遮挡，浮层菜单不受影响；全程本地处理不上传任何服务器，关闭开关或一键恢复默认即可完全移除；内置中英文双语界面。",
    repo = "https://github.com/leavestring/awesome-dsh-background-plugin",
    homepage = "https://github.com/leavestring/awesome-dsh-background-plugin",
    licenses = {"MIT"},
    authors = {"leavestring"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "awesome-dsh-background-plugin",

        versions = {
            ["0.1.9"] = { commit = "2b758a6fed8dfc79644c0cfb755eae11a7778332" },
        },
        latest = "0.1.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
