package = {
    spec = "1",

    name = "dsh-chat-import",
    description = "从Claude Code导入历史消息，并在DSH中继续对话",
    repo = "https://github.com/Nwflower/dsh-chat-import",
    homepage = "https://github.com/Nwflower/dsh-chat-import",
    licenses = {"MIT"},
    authors = {"Nwflower"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "session"},
    keywords = {"dsh", "agent", "ai-agents", "automation", "chatgpt", "claude-code", "codex", "cursor", "developer-tools"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-chat-import",

        versions = {
            ["0.6.0"] = { commit = "8ab5fb73b15c218eada298a6be8b50876836b23e" },
            ["0.5.1"] = { commit = "cd476356bcc6e4192aed8bec6211bd68a529e061" },
            ["0.4.0"] = { commit = "36a4ea2aa1dccf21db151aeba87f0a508a28c973" },
            ["0.3.1"] = { commit = "eea0b4f937d92d51683620cacedac4f112000adb" },
            ["0.2.0"] = { commit = "716295709890944639e0654a7476fe572ddabf50" },
            ["0.1.1"] = { commit = "c6913244337f9ed70e8fea2a83622ac8550ea1ee" },
        },
        latest = "0.6.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.2.0"] = {
                tarball = "dsh-chat-import-0.2.0.tgz",
                sha256  = "79d342e7a5dbf7cafbe248b21079921ac81fe1e372940c6bd07fd5ab5bff78a2",
                cn      = true,
            },
            ["0.1.1"] = {
                tarball = "dsh-chat-import-0.1.1.tgz",
                sha256  = "6690ee9c24336aa64b6f85b4eb9dfd03728232b41561505c4eb7e7f28f0aeb41",
                cn      = true,
            },
        },
    },
}
