package = {
    spec = "1",

    name = "dsh-aurabot-qq",
    description = "DeepSeek Harness 插件：让 AI 以「大肥鱼」住进 QQ（SnowLuma / OneBot v11）。表情、语音、记忆、空间、B 站、翻唱、生图全部模块化——可关、可换、可本地自写扩展，连群聊策略、提示词、回复和模型都能改，保存即生效。",
    repo = "https://github.com/accomplish07zrh-eng/dsh-aurabot-qq",
    homepage = "https://github.com/accomplish07zrh-eng/dsh-aurabot-qq",
    licenses = {"MIT"},
    authors = {"accomplish07zrh-eng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-aurabot-qq",

        versions = {
            ["1.0.4"] = { commit = "b502b8364cfda1437bce42144e3b290be567efac" },
        },
        latest = "1.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
