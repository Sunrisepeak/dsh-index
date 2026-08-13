package = {
    spec = "1",

    name = "dsh-session-notification",
    description = "提供会话完成等四种状态的通知响应，支持浏览器提示和提示词",
    repo = "https://github.com/dingyi222666/dsh-session-notification",
    homepage = "https://github.com/dingyi222666/dsh-session-notification",
    authors = {"dingyi222666"},

    status = "dev",
    categories = {"dsh-plugin", "skills", "session"},
    keywords = {"dsh", "session", "notification"},

    dsh = {
        bundle_name = "@dingyi222666/dsh-session-notification",
        source = "github",
        origin = "dingyi222666/dsh-session-notification",

        versions = {
            ["0.1.1"] = { ref = "499c52ed0e1f7cef6a9c1a0667daad0d97e8e6b6" },
        },
        latest = "0.1.1",

        needs_build = true,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
