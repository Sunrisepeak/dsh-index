package = {
    spec = "1",

    name = "dsh-session-messaging",
    description = "DeepSeek Harness plugin: let top-level sessions find, message, and spawn each other (session_list / session_send_message / session_create) · 支持一句话让 DSH 自动安装",
    repo = "https://github.com/tonyzdev/dsh-session-messaging",
    homepage = "https://github.com/tonyzdev/dsh-session-messaging",
    licenses = {"MIT"},
    authors = {"tonyzdev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "@tonyzdev/dsh-session-messaging",

        versions = {
            ["0.3.2"] = { commit = "69a97309ab3462249bdd02802d700ed93d08c55f" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
