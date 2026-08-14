package = {
    spec = "1",

    name = "dsh-side-workspace",
    description = "DSH plugin: Codex-style side conversations (/side, /btw), an integrated right workspace (Side/Subagents/Goal) and a ChatGPT-style pinned-notes board",
    repo = "https://github.com/invalidnaaaame/dsh-side-workspace",
    homepage = "https://github.com/invalidnaaaame/dsh-side-workspace",
    licenses = {"MIT"},
    authors = {"invalidnaaaame"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-side",

        versions = {
            ["0.2.0"] = { commit = "00289ed7625c5e4251c76be65999ac6ba4cd2aab" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
