package = {
    spec = "1",

    name = "dsh-track",
    description = "DSH Track Bridge 插件：嵌入式任务管理引擎——决策点协议、念头捕获墙、Linear 形 issue 存储（bundle），AI 与人之间的任务轨道",
    repo = "https://github.com/fakechris/dsh-track",
    homepage = "https://github.com/fakechris/dsh-track",
    licenses = {"BSD-3-Clause"},
    authors = {"fakechris"},

    status = "dev",
    categories = {"dsh-plugin", "session"},
    keywords = {"dsh", "task-management", "track"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-track",
        source = "github",
        origin = "fakechris/dsh-track",

        versions = {
            ["0.2.1"] = { ref = "f970dfd5fcd9961c2f25ddb3b146d0a1531accc9" },
        },
        latest = "0.2.1",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
