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
        source = "github",
        origin = "vlln/dsh-task-status",

        versions = {
            ["0.3.0"] = { ref = "4453da02d62289aeb19b046b4d2b5439dd4ce55a" },
        },
        latest = "0.3.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
