package = {
    spec = "1",

    name = "dsh-plugin-rea",
    description = "第三方适配插件：把上游 REA（github.com/morluto/rea）的 MCP 服务接入 DeepSeek Harness，提供 mcp__rea__* 工具。2.x 会自动准备 Node、REA CLI、JDK 与 Ghidra 并把那一行接好；逆向分析能力全部由上游 REA 提供。",
    repo = "https://github.com/czcdr/dsh-plugin-rea",
    homepage = "https://github.com/czcdr/dsh-plugin-rea",
    licenses = {"MIT"},
    authors = {"czcdr"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-plugin-rea",

        versions = {
            ["2.0.11"] = { commit = "1438672f9a57d92680254ad3782baec0b34c5d3f" },
        },
        latest = "2.0.11",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
