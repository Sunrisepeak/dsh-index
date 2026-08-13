package = {
    spec = "1",

    name = "dsh-annotation",
    description = "DSH Web 选中批注插件：选文字→批注→回车随消息发送；气泡隐藏批注块（零闪烁）；回复按 Annotation N 逐条对照（可悬浮芯片）。官方 bundle，零核心改动",
    repo = "https://github.com/omdsh-dev/dsh-annotation",
    homepage = "https://github.com/omdsh-dev/dsh-annotation",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "annotation"},

    dsh = {
        bundle_name = "@omdsh-dev/dsh-annotation",

        versions = {
            ["1.3.13"] = { commit = "a37edb01c3dbb0b19249cab3b93138ad529281ed" },
        },
        latest = "1.3.13",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
