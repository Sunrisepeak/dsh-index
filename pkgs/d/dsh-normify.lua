package = {
    spec = "1",

    name = "dsh-normify",
    description = "Normify · DSH 插件：把项目架构写成归一化的分形模块树，三层校验（写时 / 校验 / 冻结回执）、30 个 normify_* 工具 + normify-gen 技能，一键渲染单文件交互式架构图；支持伴随式开发（change_open → brief → check → 实施 → refresh → change_close）。",
    repo = "https://github.com/yan-mc/dsh-normify",
    homepage = "https://github.com/yan-mc/dsh-normify",
    licenses = {"MIT"},
    authors = {"yan-mc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web-desktop",

        bundle_name = "@dsh-external/dsh-normify",

        versions = {
            ["0.5.4"] = { commit = "ed404e5b8db0010ff57ec8486ec8749421072545" },
        },
        latest = "0.5.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
