package = {
    spec = "1",

    name = "dsh-drop-to-path",
    description = "DSH 插件:图片与文件直达纯文本模型——图片保留原生附件体验,PDF/Office/压缩包/视频/音频显示为附件栏方块,点击发送时自动转为工作区路径,配合 dsh-vision-toolkit 粘贴即看图。A DSH plugin that delivers images AND files to text-only models as workspace paths: images keep the native attachment UI, other files show as square chips in the rail, paths append on send — pairs with dsh-vision-toolkit.",
    repo = "https://github.com/loudMore/dsh-drop-to-path",
    homepage = "https://github.com/loudMore/dsh-drop-to-path",
    licenses = {"MIT"},
    authors = {"loudMore"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-drop-to-path",

        versions = {
            ["0.1.0"] = { commit = "a00a5a2e18fd89e829b1c96f2f2e85af67366e10" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
