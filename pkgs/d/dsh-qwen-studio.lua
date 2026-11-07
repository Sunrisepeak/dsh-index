package = {
    spec = "1",

    name = "dsh-qwen-studio",
    description = "Qwen Image 2.1 for DeepSeek Harness: native image editing on Apple Silicon MLX/MFLUX or self-hosted CUDA, LoRA, ControlNet, inpainting, presets & live agent progress. 本机生图 · 原生参考编辑",
    repo = "https://github.com/kingcharleslzy-ai/dsh-qwen-studio",
    homepage = "https://github.com/kingcharleslzy-ai/dsh-qwen-studio",
    licenses = {"Apache-2.0"},
    authors = {"kingcharleslzy-ai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-qwen-studio",

        versions = {
            ["2.19.0"] = { commit = "0791bfe5dd2196e4963d77a83df770e4f26d14d8" },
        },
        latest = "2.19.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
