package = {
    spec = "1",

    name = "dsh-revive",
    description = "DSH 一键复活：重启后给所有被打断的会话自动发送「继续」指令（/revive 命令 + revive_sessions 工具 + 浏览器一键按钮）",
    repo = "https://github.com/omdsh-dev/dsh-revive",
    homepage = "https://github.com/omdsh-dev/dsh-revive",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "tools", "session"},
    keywords = {"dsh", "revive"},

    dsh = {
        bundle_name = "dsh-revive",

        versions = {
            ["0.1.4"] = { commit = "8569ed48e9f6a7f446c5638e88ae276d36aa18ac" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
