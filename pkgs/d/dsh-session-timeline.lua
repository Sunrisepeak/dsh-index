package = {
    spec = "1",

    name = "dsh-session-timeline",
    description = "DeepSeek Harness 会话时间轴插件：横短横线波浪、当前消息定位、点击跳转、圆角预览 tooltip、可收起/展开",
    repo = "https://github.com/XiLuovo/dsh-session-timeline",
    homepage = "https://github.com/XiLuovo/dsh-session-timeline",
    licenses = {"MIT"},
    authors = {"XiLuovo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-session-timeline",

        versions = {
            ["1.0.0"] = { commit = "33e8a3216c25a3bddbfdad922d79e1ac5769e951" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
