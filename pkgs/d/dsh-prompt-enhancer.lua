package = {
    spec = "1",

    name = "dsh-prompt-enhancer",
    description = "DeepSeek Harness DSH 提示词增强插件：✨ 一键优化草稿，增强提示词。",
    repo = "https://github.com/Fishsb/dsh-prompt-enhancer",
    homepage = "https://github.com/Fishsb/dsh-prompt-enhancer",
    licenses = {"MIT"},
    authors = {"Fishsb"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-prompt-enhancer",

        versions = {
            ["3.1.3"] = { commit = "2ce1ed13ea1a112ef397421dcaadd8850352833e" },
        },
        latest = "3.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
