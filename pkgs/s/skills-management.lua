package = {
    spec = "1",

    name = "skills-management",
    description = "DeepSeek Harness 插件：技能市场——安装/删除/详情 API + 管理界面",
    repo = "https://github.com/weibaohui/skills-management",
    homepage = "https://github.com/weibaohui/skills-management",
    authors = {"weibaohui"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@weibaohui/skills-management",

        versions = {
            ["0.7.0"] = { commit = "84d39f0143a92a634227bc689844afc219659d5b" },
        },
        latest = "0.7.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
