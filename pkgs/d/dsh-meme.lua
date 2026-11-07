package = {
    spec = "1",

    name = "dsh-meme",
    description = "DeepSeek Harness 的表情包插件——找得到、发得出、学得会，纯文本斗图、情绪主动发图、像 QQ/微信 一样发图、AI 自动学图、自定义表情包 、多种风格随意切换。",
    repo = "https://github.com/yyh-001/dsh-meme",
    homepage = "https://github.com/yyh-001/dsh-meme",
    licenses = {"MIT"},
    authors = {"yyh-001"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-meme",

        versions = {
            ["0.1.38"] = { commit = "5c83b91fe2942279b677ae537850e77504e26c7c" },
        },
        latest = "0.1.38",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
