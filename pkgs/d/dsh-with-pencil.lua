package = {
    spec = "1",

    name = "dsh-with-pencil",
    description = "Official Pencil (pen.dev) canvas inside DeepSeek Harness: conversation-bound workspaces, live agent edits, and 7 MCP design tools — headless engine + browser editor.",
    repo = "https://github.com/IWAIBAOLI/dsh-with-pencil",
    homepage = "https://github.com/IWAIBAOLI/dsh-with-pencil",
    licenses = {"MIT"},
    authors = {"IWAIBAOLI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-with-pencil",

        versions = {
            ["0.5.4"] = { commit = "1e1a9d1fa7b62aa5ea820cb0a31d11da152023f7" },
        },
        latest = "0.5.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
