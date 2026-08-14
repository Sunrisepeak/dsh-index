package = {
    spec = "1",

    name = "dsh-image-tools",
    description = "DSH bundle plugin: chat-image bridge + read_image deny + conversational image_recognize for text-only main models | 纯文本主模型识图桥接与识图工具",
    repo = "https://github.com/xiaoxianyu-office/dsh-image-tools",
    homepage = "https://github.com/xiaoxianyu-office/dsh-image-tools",
    licenses = {"MIT"},
    authors = {"xiaoxianyu-office"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-image-tools",

        versions = {
            ["0.3.6"] = { commit = "6d3a1abd0cf5622c994b5388036886a08e761a75" },
        },
        latest = "0.3.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
