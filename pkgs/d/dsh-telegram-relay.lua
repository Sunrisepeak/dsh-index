package = {
    spec = "1",

    name = "dsh-telegram-relay",
    description = "DSH Relay 让你可以通过 Telegram 远程与 DeepSeek Harness 对话，并接收通知。DSH Relay turns Telegram into a remote conversation and notification channel for DeepSeek Harness.",
    repo = "https://github.com/congchuanling-dot/DSH-Telegram-Relay",
    homepage = "https://github.com/congchuanling-dot/DSH-Telegram-Relay",
    licenses = {"Apache-2.0"},
    authors = {"congchuanling-dot"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-telegram-relay",

        versions = {
            ["0.1.0"] = { commit = "9bf342f3ea407ceedd99b5342dfd0edc07958797" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
