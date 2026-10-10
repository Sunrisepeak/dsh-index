package = {
    spec = "1",

    name = "dsh-skills-mcp-manager",
    description = "面向 DeepSeek Harness Web GUI 的正式插件包：在设置页的「Web UI 插件」分组中新增一张「技能与 MCP」卡片，用于在浏览器里管理技能（skills）与 MCP 服务器。",
    repo = "https://github.com/zebbkira/dsh-skills-mcp-manager",
    homepage = "https://github.com/zebbkira/dsh-skills-mcp-manager",
    authors = {"zebbkira"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zebbkira/dsh-skills-mcp-manager",

        versions = {
            ["0.1.3"] = { commit = "8092f2df3fb6869f9b274406c67354c24d47d4e4" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
