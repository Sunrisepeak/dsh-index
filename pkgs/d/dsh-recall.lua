package = {
    spec = "1",

    name = "dsh-recall",
    description = "Message recall (撤回) plugin for the DSH Web UI: one undo button on each user message that removes the turn and everything after it, durably, without reverting code changes.",
    repo = "https://github.com/Mongfayi/dsh-recall",
    homepage = "https://github.com/Mongfayi/dsh-recall",
    licenses = {"MIT"},
    authors = {"Mongfayi"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-recall",

        versions = {
            ["0.1.0"] = { commit = "7c8e2bd3b8afba7d26559cdce5151e9720bfdc2c" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
