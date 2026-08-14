package = {
    spec = "1",

    name = "dsh-ads",
    description = "是兄弟就来蹬我！DSH Web UI 广告：2005 年中文站点风格的侧栏广告 / 对话内信息流 / 角落弹窗 + 一个真实热区比视觉小得多的关闭叉。素材全虚构，域名打码。",
    repo = "https://github.com/Nagi-ovo/dsh-ads",
    homepage = "https://github.com/Nagi-ovo/dsh-ads",
    authors = {"Nagi-ovo"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "vision"},
    keywords = {"dsh", "ads"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-ads",

        versions = {
            ["0.1.0"] = { commit = "35547f7001afd6b853c2010b196365f61eebf8f1" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
