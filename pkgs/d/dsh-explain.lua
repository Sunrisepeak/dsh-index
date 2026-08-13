package = {
    spec = "1",

    name = "dsh-explain",
    description = "DSH 本地优先学习模式插件：跨会话全局学习线程、按来源讲解、ExplainContext、压缩与可诊断设置界面",
    repo = "https://github.com/yuezengwu/dsh-explain",
    homepage = "https://github.com/yuezengwu/dsh-explain",
    licenses = {"MIT"},
    authors = {"yuezengwu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-explain",
        source = "github",
        origin = "yuezengwu/dsh-explain",

        versions = {
            ["0.1.0"] = { ref = "ed25029189db2c5d1a9a1f80ac6af4609431efc2" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
