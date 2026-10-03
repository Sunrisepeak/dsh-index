package = {
    spec = "1",

    name = "dsh-plugin-swift-cycle",
    description = "Swift Cycle governance skill adapter for DeepSeek Harness; user-invoked, version-pinned, and offline-verifiable.",
    repo = "https://github.com/Solismuchengxue/dsh_plugin_swift_cycle",
    homepage = "https://github.com/Solismuchengxue/dsh_plugin_swift_cycle",
    licenses = {"MIT"},
    authors = {"Solismuchengxue"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-swift-cycle",

        versions = {
            ["0.1.1"] = { commit = "b4fbdcc8b7e86ad3cb1e5350aa2ee2bf0b90457c" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
