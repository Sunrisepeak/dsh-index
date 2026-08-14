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
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@omdsh-dev/dsh-annotation",

        versions = {
            ["1.3.14"] = { commit = "687f13dcf154e8b473b4e3d8652a08fc72c1c806" },
            ["1.3.13"] = { commit = "a37edb01c3dbb0b19249cab3b93138ad529281ed" },
        },
        latest = "1.3.14",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["1.3.13"] = {
                tarball = "dsh-annotation-1.3.13.tgz",
                sha256  = "f79c1035848e94b297ee96389bb44eda042516e20ae93c8d1054be08b979c11c",
                cn      = true,
            },
        },
    },
}
