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
        bundle_name = "dsh-cc-tui",
        source = "github",
        origin = "ccch1mneyyy/dsh-cc-tui",

        versions = {
            ["0.1.6"] = { ref = "8516ffb3aac3ada74760eff9b8c14c65d344b67d" },
        },
        latest = "0.1.6",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Published by tools/mirror.py to both mirrors and verified three
        -- ways: the bytes built here, what GitHub serves, and what GitCode
        -- serves all hash to the same digest. `cn = true` is what turns the
        -- CN URL on in template.lua.
        mirror = {
            ["0.1.6"] = {
                tarball = "dsh-cc-tui-0.1.6.tgz",
                sha256  = "b8016904a72e7bf4858a0bb24e6eb952357ecdc7e963a482f33e143ea2312d1b",
                cn      = true,
            },
        },
    },
}
