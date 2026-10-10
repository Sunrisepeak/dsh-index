package = {
    spec = "1",

    name = "dsh-whale-girl-live2d",
    description = "🐋 鲸鱼娘桌宠 · Whale Girl Live2D —— DSH（DeepSeek Harness）Web 界面里的 Live2D 桌宠：跟着 agent 的真实状态换表情与动作，点一下就能直接跟 agent 说话，右键是钱包。A Live2D desktop pet for the DSH Web UI. 安装 Install: dsh plugin --profile web add github:Andersen216/dsh-whale-girl-live2d",
    repo = "https://github.com/Andersen216/dsh-whale-girl-live2d",
    homepage = "https://github.com/Andersen216/dsh-whale-girl-live2d",
    licenses = {"MIT"},
    authors = {"Andersen216"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-girl-live2d",

        versions = {
            ["0.4.6"] = { commit = "b304f2b40b3dc5a1db0a1a88ce9322912038c1b6" },
        },
        latest = "0.4.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
