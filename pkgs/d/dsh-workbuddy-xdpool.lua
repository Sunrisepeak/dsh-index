package = {
    spec = "1",

    name = "dsh-workbuddy-xdpool",
    description = "把 WorkBuddy 桌面 App 里登录过的所有账号（国内版和国际版都支持），合成一个 DSH 模型池。你在 WorkBuddy 里登过几个号，池里就有几个号——不用手动填表，不用一个个录入。  哪个号被限流了、积分用光了，请求自动换到下一个能用的号上去。你只管问，剩下的它自己处理。  另外附送一整套「积分自动化」：签到、领任务奖励、连登兑换、开猫猫旅行……这些每天都要手动点一遍的活儿，插件在后台替你干完了。",
    repo = "https://github.com/XDTrees/dsh-workbuddy-xdpool",
    homepage = "https://github.com/XDTrees/dsh-workbuddy-xdpool",
    licenses = {"MIT"},
    authors = {"XDTrees"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-workbuddy-xdpool",

        versions = {
            ["1.7.0"] = { commit = "fbce993979d91588274ed945661677ff5256c171" },
        },
        latest = "1.7.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
