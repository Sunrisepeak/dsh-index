package = {
    spec = "1",

    name = "dsh-multi-tenant-projects",
    description = "Multi-tenant projects & users plugin for DeepSeek Harness (DSH): per-user symlinked workspaces, login gate, session isolation, workspace-write lock and system-prompt guard",
    repo = "https://github.com/king-bcolor/dsh-multi-tenant-projects",
    homepage = "https://github.com/king-bcolor/dsh-multi-tenant-projects",
    authors = {"king-bcolor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-multi-tenant-projects",

        versions = {
            ["0.1.0"] = { commit = "77dfd9e67240d48e159d1886dd9a29d9cebf5425" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
