package = {
    spec = "1",

    name = "recruiting-copilot",
    description = "给 HR / 猎头的 AI 招聘工作流：岗位标准梳理、Boss直聘 + 猎聘双通道寻源初筛、市场人才盘点、简历评估、约面试、候选人台账与日报。可装成 Claude Code 插件或 DeepSeek Harness (dsh) 插件——后者自带可直接上手操作的「招聘浏览器」面板；也能配合任意读 AGENTS.md 的 AI 编程助手使用。",
    repo = "https://github.com/Viy1204/recruiting-copilot",
    homepage = "https://github.com/Viy1204/recruiting-copilot",
    authors = {"Viy1204"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "recruiting-copilot",

        versions = {
            ["0.6.0"] = { commit = "20cf113d013d5babb30355f37e41440fcf4d9b40" },
        },
        latest = "0.6.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
