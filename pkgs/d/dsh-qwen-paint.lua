package = {
    spec = "1",

    name = "dsh-qwen-paint",
    description = "DSH 插件：在对话里调用本机 ComfyUI，用千问 Qwen-Image 2.1 出图。纯本地、不出网、不需要 API Key。",
    repo = "https://github.com/wonderandyou/dsh-qwen-paint",
    homepage = "https://github.com/wonderandyou/dsh-qwen-paint",
    licenses = {"MIT"},
    authors = {"wonderandyou"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-qwen-paint",

        versions = {
            ["0.1.2"] = { commit = "ef86e5a44772082d9b720eb0f99b57db6acfbb38" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
