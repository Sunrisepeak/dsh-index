package = {
    spec = "1",

    name = "dsh-chinese-traditional-wisdom-skill",
    description = "中华传统智慧（玄枢）AI Agent 技能包的 DeepSeek Harness（dsh）Cordis 插件：八字/紫微/六爻/梅花/奇门/风水/五运六气/体质全融合，本地确定性引擎 + 可视化 Dashboard，一行 dsh plugin add 安装。",
    repo = "https://github.com/dhicoc/dsh-chinese-traditional-wisdom-skill",
    homepage = "https://github.com/dhicoc/dsh-chinese-traditional-wisdom-skill",
    authors = {"dhicoc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dhicoc/dsh-chinese-traditional-wisdom-skill",

        versions = {
            ["1.0.0"] = { commit = "c06983761eecac95fdfab49461586c0a0c01dfb3" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
