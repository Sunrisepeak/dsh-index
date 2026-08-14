package = {
    spec = "1",

    name = "dsh-her-eyes",
    description = "一个可以让ai自动调用VLM(多模态模型)进行视觉分析的dsh插件。A dsh plugin that allows AI to automatically invoke VLMs (multimodal models) for visual analysis.",
    repo = "https://github.com/huashenglian/dsh-her-eyes",
    homepage = "https://github.com/huashenglian/dsh-her-eyes",
    licenses = {"MIT"},
    authors = {"huashenglian"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-her-eyes",

        versions = {
            ["1.2.0"] = { commit = "73799bf935ac2dc878fd35a54b79453d417d817f" },
        },
        latest = "1.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
