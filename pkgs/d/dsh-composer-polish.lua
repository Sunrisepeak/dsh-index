package = {
    spec = "1",

    name = "dsh-composer-polish",
    description = "DeepSeek Harness plugin: one-click ✨ polish for composer drafts — flash rewrite, auto fill-back · DeepSeek Harness 插件：输入框草稿一键 ✨ 润色，flash 改写、自动回填",
    repo = "https://github.com/tianji-qingtian/dsh-composer-polish",
    homepage = "https://github.com/tianji-qingtian/dsh-composer-polish",
    licenses = {"MIT"},
    authors = {"tianji-qingtian"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-composer-polish",

        versions = {
            ["0.1.3"] = { commit = "ce4daad54dcd174f5fb43a1bb290a29bb1ceec4f" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
