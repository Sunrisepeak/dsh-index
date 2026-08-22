package = {
    spec = "1",

    name = "dsh-plugin-bridge",
    description = "Cross-preset session migration for DeepSeek Harness: fixed-schema handoff summaries instead of bypassing the preset lock. 26-run benchmark + A/B evidence. 跨 preset 会话迁移插件（固定 schema 交接摘要），含实测 benchmark 与 A/B 对照。",
    repo = "https://github.com/Totoro-qaq/dsh-plugin-bridge",
    homepage = "https://github.com/Totoro-qaq/dsh-plugin-bridge",
    licenses = {"MIT"},
    authors = {"Totoro-qaq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-bridge",

        versions = {
            ["0.2.0"] = { commit = "4fb529e922bd31f7891de44e25a9531cebca1ad1" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
