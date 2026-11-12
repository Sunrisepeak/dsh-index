package = {
    spec = "1",

    name = "dsh-android",
    description = "DeepSeek Harness plugin for Android — build, run, and interact with a live emulator or USB device stream inside a conversation, driven entirely through adb.",
    repo = "https://github.com/ZSeven-W/dsh-android",
    homepage = "https://github.com/ZSeven-W/dsh-android",
    licenses = {"MIT"},
    authors = {"ZSeven-W"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zseven-w/dsh-android",

        versions = {
            ["0.1.0-rc.4"] = { commit = "8c1d19a0019f2fbf65265ac8a09225d0b2fdf8c4" },
        },
        latest = "0.1.0-rc.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
