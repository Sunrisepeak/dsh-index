package = {
    spec = "1",

    name = "dsh-maze",
    description = "DeepSeek Harness 的执行迷宫——看 Agent 真实怎么干活：迷宫时间轴 · 数据轨道 · 确定性执行分析 · 多会话对比 | The execution maze for DSH agents: maze timeline, per-step data tracks, deterministic execution analysis, multi-session comparison. Formerly dsh-trace-compare.",
    repo = "https://github.com/lamost423/dsh-maze",
    homepage = "https://github.com/lamost423/dsh-maze",
    licenses = {"MIT"},
    authors = {"lamost423"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-maze",

        versions = {
            ["1.1.0"] = { commit = "f435abffb1b026d8a1ed95ca1f1d0bc10fd5cffd" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
