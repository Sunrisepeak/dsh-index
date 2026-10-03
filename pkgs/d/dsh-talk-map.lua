package = {
    spec = "1",

    name = "dsh-talk-map",
    description = "Visual conversation map for DeepSeek Harness — sessions as cards on a whiteboard: drag to arrange, double-click to chat, draw an edge to fork with injected context. ADHD-friendly spatial memory. · DSH 可视化对话地图",
    repo = "https://github.com/Tasihi89/dsh-talk-map",
    homepage = "https://github.com/Tasihi89/dsh-talk-map",
    licenses = {"MIT"},
    authors = {"Tasihi89"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-talk-map",

        versions = {
            ["0.1.0"] = { commit = "b2d36d69b65f1a6a2c76022b1226392683767b9d" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
