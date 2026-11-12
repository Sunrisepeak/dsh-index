package = {
    spec = "1",

    name = "citeciter",
    description = "为 DeepSeek Harness 打造：选中 AI 回答或思考内容，随时追问、学习、检查与纠偏。",
    repo = "https://github.com/kirkchinese/CiteCiter",
    homepage = "https://github.com/kirkchinese/CiteCiter",
    licenses = {"MIT"},
    authors = {"kirkchinese"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@kirkchinese/dsh-citeciter",

        versions = {
            ["0.9.0-beta.1"] = { commit = "7897881bf87915505d4a7e7b9991020a2986630c" },
        },
        latest = "0.9.0-beta.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
