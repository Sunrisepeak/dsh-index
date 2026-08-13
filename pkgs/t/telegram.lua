package = {
    spec = "1",

    name = "telegram",
    description = "Telegram Bot API 桥接插件：长轮询、per-chat 会话、HTML 格式化",
    repo = "https://github.com/LoserFox/telegram",
    homepage = "https://github.com/LoserFox/telegram",
    authors = {"LoserFox"},

    status = "dev",
    categories = {"dsh-plugin", "session", "provider"},
    keywords = {"dsh", "telegram"},

    dsh = {
        bundle_name = "@loserfox/telegram",

        versions = {
            ["0.1.0"] = { commit = "a0a9ca11e427b62217250e2e561f6ad3c49d13f2" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
