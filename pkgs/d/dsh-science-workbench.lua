package = {
    spec = "1",

    name = "dsh-science-workbench",
    description = "A reproducible science workbench plugin for the DeepSeek Harness: agent-driven cells, inline figures with feedback/rerun, manifest provenance, and environment snapshots.",
    repo = "https://github.com/poplarity/dsh-science-workbench",
    homepage = "https://github.com/poplarity/dsh-science-workbench",
    licenses = {"MIT"},
    authors = {"poplarity"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-science-workbench",

        versions = {
            ["0.1.0"] = { commit = "754ed9ed9fc37db3eb4d21fd4be4842000c47b2e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
