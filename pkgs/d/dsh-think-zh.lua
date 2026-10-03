package = {
    spec = "1",

    name = "dsh-think-zh",
    description = "DeepSeek Harness 默认的思考语言为英文，这不利于中文使用者阅读推理过程与复核结论。本插件通过在每次请求的 system prompt 中注入一条精简的强制语言指令，使: 思考过程强制简体中文，无论用户用什么语言提问。",
    repo = "https://github.com/Len7183/DSH-Think-zh",
    homepage = "https://github.com/Len7183/DSH-Think-zh",
    licenses = {"MIT"},
    authors = {"Len7183"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-think-zh",

        versions = {
            ["0.1.0"] = { commit = "e6ab9d8d70b199de83bbb0f76ef9b593f474326b" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
