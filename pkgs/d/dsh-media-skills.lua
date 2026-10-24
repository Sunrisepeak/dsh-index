package = {
    spec = "1",

    name = "dsh-media-skills",
    description = "Free vision & image generation for DeepSeek Harness — paste an image into any chat, even text-only sessions. GLM-4V-Flash / Qwen3-VL / Gemini failover chain, ModLens-style structured evidence, Kolors generation. 免费读图·生图 · 三引擎容错 · 无 Key 入库",
    repo = "https://github.com/MJorgin/dsh-media-skills",
    homepage = "https://github.com/MJorgin/dsh-media-skills",
    licenses = {"MIT"},
    authors = {"MJorgin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-media-skills",

        versions = {
            ["0.2.0"] = { commit = "f5eb82dcb3b257456cfb7ce0d91289955639e708" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
