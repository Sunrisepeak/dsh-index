package = {
    spec = "1",

    name = "huashu-design",
    description = "Huashu Design 3.0 · 在 agent 里打一句话，拿回能交付的设计：网页 / App 原型 / 可编辑 PPTX / 动画 / 信息图 · 六个候选挑三个方向 · 84 种带样张的风格库 · 越用越懂你的外观账本与设计体检 · HTML-native design skill for Claude Code, Codex, Cursor & any agent",
    repo = "https://github.com/alchaincyf/huashu-design",
    homepage = "https://github.com/alchaincyf/huashu-design",
    licenses = {"MIT"},
    authors = {"alchaincyf"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "huashu-design",

        versions = {
            ["3.2.0"] = { commit = "b2460b031c33ff32d2bf3b97263527daa231e4de" },
        },
        latest = "3.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
