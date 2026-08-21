package = {
    spec = "1",

    name = "dsh-feishu-bridge",
    description = "Fail-closed Feishu (Lark) channel bridge: chat with a bot, get dsh agent turns back — opt-in human-in-the-loop bash approval (Allow/Deny cards, fail-closed timeout), one-message /pair onboarding, webhook signature/timestamp/replay verification, daily latest-SDK canary",
    repo = "https://github.com/wz-heng/dsh-feishu-bridge",
    homepage = "https://github.com/wz-heng/dsh-feishu-bridge",
    authors = {"wz-heng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "feishu", "lark", "channel", "bridge", "approval"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-feishu-bridge",

        versions = {
            ["0.1.0"] = { commit = "7cb392ee508ecd5e74d3a57c60fc06e9ca6cdb01" },
        },
        latest = "0.1.0",

        needs_build = false,
    },
}
