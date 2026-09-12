package = {
    spec = "1",

    name = "dsh-config-manager",
    description = "DeepSeek Harness (DSH) backup & restore plugin — export, import, migrate and sync your complete DSH configuration, plugins, MCP servers, skills and workspace. One-click migration to another machine.",
    repo = "https://github.com/xiajiajun516/dsh-config-manager",
    homepage = "https://github.com/xiajiajun516/dsh-config-manager",
    licenses = {"MIT"},
    authors = {"xiajiajun516"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-config-manager",

        versions = {
            ["0.1.45"] = { commit = "cbac337c64e269edb3ac9a828016338af29fa663" },
        },
        latest = "0.1.45",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
