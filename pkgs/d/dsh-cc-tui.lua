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

        -- What `latest` publishes under. Upstream renamed the npm package
        -- at 0.5.0; the two older versions still carry the old name and say
        -- so inline, because a profile manifest written against 0.3.3 records
        -- `dsh-cc-tui` and that is what `dsh plugin remove` will look for.
        bundle_name = "@deepseek-harness-tui/dsh-tui",

        versions = {
            ["0.10.0-beta.2"] = { commit = "a9fad30a1502a599c2c9f2d922846fab1d4afe10" },
            ["0.9.3"] = { commit = "4c1d09f1259690352b8854062119f47d04f66523" },
            ["0.9.2"] = { commit = "a207330dad42422e70f34f2311006a7b773938a8" },
            ["0.9.0"] = { commit = "738361246ac9925e37062f695448358bc14ffec9" },
            ["0.8.8"] = { commit = "52ae21c4b27dcdea1db5f3f6a655bea77891fe99" },
            ["0.8.6"] = { commit = "8c8e955ab1d015901f49e3b6a61fea100eb9b120" },
            ["0.8.5"] = { commit = "1f93efe85360560e3da49726d7a55af659e771fe" },
            ["0.8.1"] = { commit = "b5245b2390363d6d671ee546504126bd974b66b3" },
            ["0.8.0"] = { commit = "02ff08e1745d51d1091bf054cb5a36d2f823cc22" },
            ["0.6.1"] = { commit = "248cc2e270f9176fab929489690567ddb5073b2c" },
            ["0.5.3"] = { commit = "4f18f2482d26c661f38509ccbdbc84b89d775ba0" },
            ["0.5.0"] = { commit = "7bf8648a40e2c75ebcc4c16b5913a82f83b38fe5" },
            ["0.3.3"] = { commit = "046da285d6eb1c95bb8468a447f420f6f3c0560c", bundle = "dsh-cc-tui" },
            ["0.1.6"] = { commit = "8516ffb3aac3ada74760eff9b8c14c65d344b67d", bundle = "dsh-cc-tui" },
        },
        latest = "0.10.0-beta.2",

        -- Base rows this bundle replaces. Another bundle patching
        -- any of these in the same profile silently wins or loses,
        -- depending on install order.
        overrides = {"agent-loop", "approval", "compaction-basic", "llm-deepseek", "sandbox-policy", "session-persistence-jsonl", "system-prompt", "tool-subagent", "tool-subagent-fork"},
        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.3.3"] = {
                tarball = "dsh-cc-tui-0.3.3.tgz",
                sha256  = "e59bd5ef979e23858d6810ff1d70937d3a8fd367ab1c0f589d03a4b912352996",
                cn      = true,
            },
            ["0.1.6"] = {
                tarball = "dsh-cc-tui-0.1.6.tgz",
                sha256  = "b8016904a72e7bf4858a0bb24e6eb952357ecdc7e963a482f33e143ea2312d1b",
                cn      = true,
            },
        },

        upstream = {
            { date = "2026-08-15", event = "renamed",
              note = "上游在 0.5.0 把 npm 包名从 `dsh-cc-tui` 改为 "
                  .. "`@deepseek-harness-tui/dsh-tui`（仓库也从 dsh-cc-tui 改名为 DSH-TUI，"
                  .. "GitHub 会重定向）。索引跟随改名：0.5.0 用新名，0.3.3 与 0.1.6 仍是旧名，"
                  .. "已装的 profile 不受影响 —— `dsh plugin remove` 匹配的是当初写进 "
                  .. "manifest 的那个名字。" },
        },
    },
}
