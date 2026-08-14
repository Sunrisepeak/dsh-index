package = {
    spec = "1",

    name = "dsh-moyan",
    description = "简洁、克制、安静，旨在为您的Vibe Coding增加些许文艺感。每次打开WebUI，左下角都会出现一句话，从古诗词到文采句，再到脍炙人口的游戏台词，应有尽有。语料库可高度自定义，插件风格完全适配原生Harness界面，功能简洁明确，绝不喧宾夺主。",
    repo = "https://github.com/elviszhang007/dsh-moyan",
    homepage = "https://github.com/elviszhang007/dsh-moyan",
    licenses = {"MIT"},
    authors = {"elviszhang007"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-moyan",

        versions = {
            ["0.5.2"] = { commit = "8f5dccbe1feded8dd539f4c56764854a6dc4d0cd" },
        },
        latest = "0.5.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
