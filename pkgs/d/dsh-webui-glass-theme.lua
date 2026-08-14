package = {
    spec = "1",

    name = "dsh-webui-glass-theme",
    description = "dsh-webui-glass-theme",
    repo = "https://github.com/makuralymi/dsh-webUI-Glass-Theme",
    homepage = "https://github.com/makuralymi/dsh-webUI-Glass-Theme",
    authors = {"makuralymi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-client-ui-frosted-glass",

        versions = {
            ["0.1.0"] = { commit = "1f0d96ae3e0c22b968b129e5fd8936021a659fec" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
