package = {
    spec = "1",

    name = "dsh-in-hand",
    description = "掌上 DSH（dsh-in-hand）：DeepSeek Harness 的手机端，不用装 App——一份只读任务监控页长成的手机浏览器客户端（PWA）：会话、实时对话、交付文件、后台任务与待批准；也自带一个 GUI 侧边栏面板。 / DSH in hand: the phone client for DeepSeek Harness with no app to install, plus a GUI sidebar panel.",
    repo = "https://github.com/dingchenhui0618-arch/dsh-in-hand",
    homepage = "https://github.com/dingchenhui0618-arch/dsh-in-hand",
    licenses = {"Apache-2.0"},
    authors = {"dingchenhui0618-arch"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-in-hand",

        versions = {
            ["1.8.17"] = { commit = "eccf74c101c23f0572b3fc1d31325a67fa4497da" },
        },
        latest = "1.8.17",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
