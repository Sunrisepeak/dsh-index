package = {
    spec = "1",

    name = "dsh-game-daily",
    description = "DSH 桌面端插件：游戏日常代理（原神 / 崩坏3 / 星穹铁道）—设置页逐游戏开关、排班、计划任务自动执行并汇报 | DSH plugin for daily game automation",
    repo = "https://github.com/gychen-NJU/dsh-game-daily",
    homepage = "https://github.com/gychen-NJU/dsh-game-daily",
    licenses = {"MIT"},
    authors = {"gychen-NJU"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "headless",

        bundle_name = "dsh-game-daily",

        versions = {
            ["0.3.0"] = { commit = "3be65f2fbff4d6bba2ac63f139593f5004d9b37a" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
