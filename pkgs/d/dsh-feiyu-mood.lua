package = {
    spec = "1",

    name = "dsh-feiyu-mood",
    description = "给 AI 伙伴一个会自己判断、你看得见的心情 —— 每轮聊完自动判断涨跌，右下角挂饰看数值、情绪和时间线",
    repo = "https://github.com/Yuuyuko-uu/dsh-feiyu-mood",
    homepage = "https://github.com/Yuuyuko-uu/dsh-feiyu-mood",
    licenses = {"MIT"},
    authors = {"Yuuyuko-uu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-feiyu-mood",

        versions = {
            ["0.4.3"] = { commit = "3ff201694dd4f8f4702862e656c51decb623da50" },
        },
        latest = "0.4.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
