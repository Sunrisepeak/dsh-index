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
        bundle_name = "dsh-chat-import",
        source = "github",
        origin = "Nwflower/dsh-chat-import",

        versions = {
            ["0.1.1"] = { ref = "c6913244337f9ed70e8fea2a83622ac8550ea1ee" },
        },
        latest = "0.1.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
