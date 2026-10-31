package = {
    spec = "1",

    name = "dsh-enhance",
    description = "为 DSH Web GUI 带来新建对话命名、文件拖拽引用、编辑并重发上一条提示词、消息时间线，以及可拖拽的悬浮球与对话宽度控制",
    repo = "https://github.com/IndieXiaoLong/DSH-Enhance",
    homepage = "https://github.com/IndieXiaoLong/DSH-Enhance",
    licenses = {"MIT"},
    authors = {"IndieXiaoLong"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-enhance",

        versions = {
            ["0.1.0"] = { commit = "747663e8a09088934dc748cb5314f800f5f7ffb3" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
