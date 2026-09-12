package = {
    spec = "1",

    name = "dsh-reference-anything",
    description = "The best DeepSeek Harness plugin for referencing anything — enhanced @ menu for commands, skills, files, agent sessions, cloud drives, DSH sessions, and conversations from web-based chatbot platforms. | 最强的 DeepSeek Harness 万物引用插件——增强 @ 菜单，统一引用命令、Skills、文件、Agent 会话、云盘、DSH 会话及网页端 Chatbot 平台对话。",
    repo = "https://github.com/Chael-Chael/dsh-reference-anything",
    homepage = "https://github.com/Chael-Chael/dsh-reference-anything",
    licenses = {"MIT"},
    authors = {"Chael-Chael"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-reference-anything",

        versions = {
            ["0.3.2"] = { commit = "f0929094e738604fcb7c51eb521c3a0622e49718" },
        },
        latest = "0.3.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
