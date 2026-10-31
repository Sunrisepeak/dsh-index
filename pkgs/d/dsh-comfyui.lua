package = {
    spec = "1",

    name = "dsh-comfyui",
    description = "一个基于DeepSeek-Harness的ComfyUI插件",
    repo = "https://github.com/fandc520/dsh-comfyui",
    homepage = "https://github.com/fandc520/dsh-comfyui",
    licenses = {"MIT"},
    authors = {"fandc520"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-comfyui",

        versions = {
            ["0.3.0-beta.4"] = { commit = "0843841c7fc526d7f995427d98c87ec757fdebb0" },
        },
        latest = "0.3.0-beta.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
