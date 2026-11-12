package = {
    spec = "1",

    name = "dsh-session-superagent",
    description = "DSH 会话级 superagent：盯一个 GitHub 仓库，有变化就唤醒会话。凭证不进模型，返回统一脱敏。",
    repo = "https://github.com/MYCF711/dsh-session-superagent",
    homepage = "https://github.com/MYCF711/dsh-session-superagent",
    licenses = {"MIT"},
    authors = {"MYCF711"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-session-superagent",

        versions = {
            ["0.10.12"] = { commit = "31678ee4eb583646029f1c849ee6b7b2c9ea9ce0" },
        },
        latest = "0.10.12",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
