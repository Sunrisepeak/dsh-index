package = {
    spec = "1",

    name = "dsh-sidechain",
    description = "DSH 侧会话插件：/side 持续性侧会话（Codex 风格）与 /btw 一次性侧问（Claude 风格）——在临时 fork 中运行、不写入主会话历史；Web UI 右侧链面板内嵌对话，主会话保持不变",
    repo = "https://github.com/omdsh-dev/dsh-sidechain",
    homepage = "https://github.com/omdsh-dev/dsh-sidechain",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-sidechain",

        versions = {
            ["0.6.3"] = { commit = "ee6fadd9bae9efb36477ec17c58e1409eeabaf88" },
        },
        latest = "0.6.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
