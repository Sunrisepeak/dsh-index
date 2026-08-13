package = {
    spec = "1",

    name = "dsh-cc-tui",
    description = "DSH 官方尚无终端 TUI 的补位之作：Claude Code 风格全屏交互终端插件——像素鲸鱼顶栏、实时工作状态行、思考流式展开、双击 Esc 回滚、上下文进度条 + TPS 仪表。npm 一键安装。",
    repo = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    homepage = "https://github.com/ccch1mneyyy/dsh-cc-tui",
    licenses = {"BSD-3-Clause"},
    authors = {"ccch1mneyyy"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-cc-tui",
        source = "github",
        origin = "ccch1mneyyy/dsh-cc-tui",

        versions = {
            ["0.1.2"] = { ref = "8516ffb3aac3ada74760eff9b8c14c65d344b67d" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
