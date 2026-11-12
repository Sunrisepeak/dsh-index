package = {
    spec = "1",

    name = "dsh-pua",
    description = "DSH PUA — 为 DeepSeek Harness 提供 PUA 任务推进、角色风味、验收循环和运行状态卡片 · PUA task persistence, personas, verification loops, and live status cards for DeepSeek Harness",
    repo = "https://github.com/MichengAI/dsh-pua",
    homepage = "https://github.com/MichengAI/dsh-pua",
    licenses = {"Apache-2.0"},
    authors = {"MichengAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@michengai/dsh-pua",

        versions = {
            ["1.0.1"] = { commit = "791733b1a7c63f7818b36501eeeaa4dc85f9b0ff" },
        },
        latest = "1.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
