package = {
    spec = "1",

    name = "dsh-desktop-windowos",
    description = "DeepSeek Harness desktop shell — Tauri v2, tray + native webchat + task-done toasts, single portable exe",
    repo = "https://github.com/RAFOLIE/dsh-desktop-windowos",
    homepage = "https://github.com/RAFOLIE/dsh-desktop-windowos",
    licenses = {"MIT"},
    authors = {"RAFOLIE"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-desktop-plugin",

        versions = {
            ["1.5.10"] = { commit = "9e6b3af188f4c12bd3d267556dd816ab033883ae" },
        },
        latest = "1.5.10",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
