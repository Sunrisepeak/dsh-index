package = {
    spec = "1",

    name = "gongwen-skill",
    description = "中文公文全流程处理工具——基于 GB/T 9704《党政机关公文格式》 国家标准，面向公文写作、企事业单位材料编制场景，支持 格式检查与修复、内容优化（Word 原生修订+批注/差异对比版）、模板生成、Markdown 转公文、版头版记页码注入、事实核验、风格增强 等完整能力。原生支持 DeepSeek Harness (DSH) 技能系统，打包为可被 AI Agent 直接调用的 Skill，完全自包含，克隆即用。",
    repo = "https://github.com/linhut/gongwen-skill",
    homepage = "https://github.com/linhut/gongwen-skill",
    licenses = {"MIT"},
    authors = {"linhut"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "gongwen-skill",

        versions = {
            ["2.1.0"] = { commit = "a4d744768493aa242ccc1c16ececbdc4e722c37e" },
        },
        latest = "2.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
