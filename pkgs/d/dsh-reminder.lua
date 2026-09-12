package = {
    spec = "1",

    name = "dsh-reminder",
    description = "🔔 Cross-window completion & approval notifications for DeepSeek Harness — popup reminders that bring you back to DSH, Codex/WorkBuddy style.",
    repo = "https://github.com/Aisland-SJL/dsh-reminder",
    homepage = "https://github.com/Aisland-SJL/dsh-reminder",
    licenses = {"MIT"},
    authors = {"Aisland-SJL"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-reminder",

        versions = {
            ["0.1.0"] = { commit = "bd1b64f7056297d07ae49baecb90f1584c11f415" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
