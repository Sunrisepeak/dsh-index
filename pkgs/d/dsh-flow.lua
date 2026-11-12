package = {
    spec = "1",

    name = "dsh-flow",
    description = "dsh-flow —— DeepSeek Harness 的统一智能体画布：把需求会话、多智能体团队、成员任务与发言、依赖 DAG 编织进同一张可交互时间轴，让 Agent 从“后台运行”变成“可视化协作”。",
    repo = "https://github.com/rootkiller6788/dsh-flow",
    homepage = "https://github.com/rootkiller6788/dsh-flow",
    licenses = {"MIT"},
    authors = {"rootkiller6788"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-flow",

        versions = {
            ["0.3.0"] = { commit = "3abeaae8fae9679e28c4adb03ead3d40f69a725e" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
