package = {
    spec = "1",

    name = "thinking-level-override",
    description = "自主覆盖与调整第三方模型的思考等级，修复工具内置预设缺失或不匹配的问题。",
    repo = "https://github.com/my-dsh-plugin/thinking-level-override",
    homepage = "https://github.com/my-dsh-plugin/thinking-level-override",
    licenses = {"Apache-2.0"},
    authors = {"my-dsh-plugin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-thinking-level-override",

        versions = {
            ["0.1.0"] = { commit = "19a1b2546baad70b3168726d6b09aa520d9c63f5" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
