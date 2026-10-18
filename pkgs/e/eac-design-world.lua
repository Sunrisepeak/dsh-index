package = {
    spec = "1",

    name = "eac-design-world",
    description = "DeepSeek Harness 本地视频制作与设计插件：多轨剪辑、模板与设计体系、原生预览画布和真实文件导出",
    repo = "https://github.com/Ebony-Vinyl/EAC-design-world",
    homepage = "https://github.com/Ebony-Vinyl/EAC-design-world",
    licenses = {"AGPL-3.0"},
    authors = {"Ebony-Vinyl"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "eac-design-world",

        versions = {
            ["0.4.0"] = { commit = "370eb4fab632bf698f69a1328d1fcffccf2c3f99" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
