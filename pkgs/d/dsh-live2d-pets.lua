package = {
    spec = "1",

    name = "dsh-live2d-pets",
    description = "Live2D 桌宠插件 for DeepSeek Harness：Agent 状态镜像 + 互动陪伴，内置宽松许可预设模型 / Live2D pet plugin: agent state mirror + interactive companion with curated permissive-license presets",
    repo = "https://github.com/cyanfish-x/dsh-live2d-pets",
    homepage = "https://github.com/cyanfish-x/dsh-live2d-pets",
    authors = {"cyanfish-x"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-live2d-pets",

        versions = {
            ["0.2.2"] = { commit = "a22ed5e0c17d8588a0aabce2ff9eee8dcf44528e" },
        },
        latest = "0.2.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
