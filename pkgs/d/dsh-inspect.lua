package = {
    spec = "1",

    name = "dsh-inspect",
    description = "发现问题(checkup) → 修复交付(fix) → 质量复查(review) 的对抗式闭环插件：基于官方 workflow 引擎的检查/修复/复查工具集",
    repo = "https://github.com/omdsh-dev/dsh-inspect",
    homepage = "https://github.com/omdsh-dev/dsh-inspect",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "tools"},
    keywords = {"dsh", "inspect"},

    dsh = {
        bundle_name = "@dsh-external/dsh-inspect",

        versions = {
            ["0.1.0"] = { commit = "9876349054f0fec33114f7f594b4901b7e9420f1" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-inspect-0.1.0.tgz",
                sha256  = "328cfb45af41fec2e6c058242b8fba112be0ce337576965348e2f98ea083d913",
                cn      = true,
            },
        },
    },
}
