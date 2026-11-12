package = {
    spec = "1",

    name = "dsh-profile-stats",
    description = "Personal usage profile page for the DeepSeek Harness Web UI: tokens, peak day, streaks, activity heatmap, per-provider billing split — all from local session logs.",
    repo = "https://github.com/Lovenndme/dsh-profile-stats",
    homepage = "https://github.com/Lovenndme/dsh-profile-stats",
    licenses = {"MIT"},
    authors = {"Lovenndme"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-profile-stats",

        versions = {
            ["2.4.15"] = { commit = "f12531322cf75dba4fd9a44f152157090afefdcb" },
        },
        latest = "2.4.15",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
