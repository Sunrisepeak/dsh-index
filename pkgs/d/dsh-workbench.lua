package = {
    spec = "1",

    name = "dsh-workbench",
    description = "A Codex-like file workspace for DeepSeek Harness Web with read-only previews and real DSH write/edit diffs.",
    repo = "https://github.com/lee259/dsh-workbench",
    homepage = "https://github.com/lee259/dsh-workbench",
    licenses = {"MIT"},
    authors = {"lee259"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-workbench",

        versions = {
            ["0.2.4"] = { commit = "f69e153c750340cbb56a633c6eeadb86a4dec08f" },
        },
        latest = "0.2.4",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
