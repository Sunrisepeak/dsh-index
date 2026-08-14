package = {
    spec = "1",

    name = "dsh-cc-tui",
    description = "DSH 官方尚无终端 TUI 的补位之作：Claude Code 风格全屏交互终端插件——像素鲸鱼顶栏、实时工作状态行、思考流式展开、双击 Esc 回滚、上下文进度条 + TPS 仪表。npm 一键安装。",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    homepage = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},
    authors = {"ccch1mneyyy"},

    status = "dev",
    categories = {"dsh-plugin", "tui", "web-ui"},
    keywords = {"dsh", "claude-code", "coding-agent", "ink", "react", "terminal", "tui"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "cc-tui",

        bundle_name = "dsh-cc-tui",

        versions = {
            ["0.3.3"] = { commit = "046da285d6eb1c95bb8468a447f420f6f3c0560c" },
            ["0.1.6"] = { commit = "8516ffb3aac3ada74760eff9b8c14c65d344b67d" },
        },
        latest = "0.3.3",

        -- Base rows this bundle replaces. Another bundle patching
        -- any of these in the same profile silently wins or loses,
        -- depending on install order.
        overrides = {"agent-loop", "approval", "compaction-basic", "llm-deepseek", "sandbox-policy", "session-persistence-jsonl", "system-prompt", "tool-subagent", "tool-subagent-fork"},
        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.6"] = {
                tarball = "dsh-cc-tui-0.1.6.tgz",
                sha256  = "b8016904a72e7bf4858a0bb24e6eb952357ecdc7e963a482f33e143ea2312d1b",
                cn      = true,
            },
        },
    },
}
