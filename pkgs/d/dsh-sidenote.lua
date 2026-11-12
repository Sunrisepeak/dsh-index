package = {
    spec = "1",

    name = "dsh-sidenote",
    description = "侧边开一岔对话，划选留一条注释——DSH（DeepSeek Harness）插件：fork 主会话成侧边会话，支线问题不打断主线，结论一键回流。Side chat & selection annotations for DSH.",
    repo = "https://github.com/g-yixuan/dsh-sidenote",
    homepage = "https://github.com/g-yixuan/dsh-sidenote",
    licenses = {"MIT"},
    authors = {"g-yixuan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-sidenote",

        versions = {
            ["0.8.3"] = { commit = "5f5a9d46ecfaaa771d2d4a2f4e0a4e9ac8ba79e6" },
        },
        latest = "0.8.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
