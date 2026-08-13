package = {
    spec = "1",

    name = "dsh-task-status",
    description = "DSH 插件：后台任务状态条（对话页任务进度 + 实时输出 tail）。官方 bundle 插件，dsh plugin --profile web add 安装",
    repo = "https://github.com/vlln/dsh-task-status",
    homepage = "https://github.com/vlln/dsh-task-status",
    licenses = {"MIT"},
    authors = {"vlln"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "session"},
    keywords = {"dsh", "ui"},

    dsh = {
        bundle_name = "@dsh-external/dsh-task-status",

        versions = {
            ["0.3.0"] = { commit = "4453da02d62289aeb19b046b4d2b5439dd4ce55a" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.3.0"] = {
                tarball = "dsh-task-status-0.3.0.tgz",
                sha256  = "e6108544fabaee1b2552505870188b28df4c08fe68515975b01577502fde44c1",
                cn      = true,
            },
        },
    },
}
