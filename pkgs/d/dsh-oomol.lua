package = {
    spec = "1",

    name = "dsh-oomol",
    description = "OOMOL Connector for DeepSeek Harness—discover connected apps and execute Actions through progressive MCP discovery without exposing provider credentials.",
    repo = "https://github.com/oomol-lab/dsh-oomol",
    homepage = "https://github.com/oomol-lab/dsh-oomol",
    licenses = {"MIT"},
    authors = {"oomol-lab"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-oomol",

        versions = {
            ["0.1.4"] = { commit = "fe265261e4cfd333a879c8dc6385b81cc3210fd9" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
