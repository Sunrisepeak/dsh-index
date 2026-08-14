package = {
    spec = "1",

    name = "dsh-bookmarks",
    description = "Bookmark assistant replies in DeepSeek Harness: per-message bookmarks with notes/tags, a cross-session center, and one-click Markdown export.",
    repo = "https://github.com/penguin-oo/dsh-bookmarks",
    homepage = "https://github.com/penguin-oo/dsh-bookmarks",
    licenses = {"MIT"},
    authors = {"penguin-oo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-bookmarks",

        versions = {
            ["0.1.0"] = { commit = "691b93721f51e7fed5769cc4715694aa62582023" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
