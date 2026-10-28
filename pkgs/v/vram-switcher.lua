package = {
    spec = "1",

    name = "vram-switcher",
    description = "GPU coordination for local AI companions on AstrBot / DeepSeek Harness: persona LLM, IndexTTS voice and ComfyUI selfies take turns on one 12 GB card. No proxy.",
    repo = "https://github.com/xiaoxiao150/vram-switcher",
    homepage = "https://github.com/xiaoxiao150/vram-switcher",
    licenses = {"MIT"},
    authors = {"xiaoxiao150"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-vram-switcher",

        versions = {
            ["2.0.4"] = { commit = "fbf9aef44e9bae821f4fa92a212db17f6b4ad9da" },
        },
        latest = "2.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
