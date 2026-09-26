package = {
    spec = "1",

    name = "dsh-composer-history",
    description = "Terminal-style input history for the DeepSeek Harness web composer: edge-first arrows with exact draft/caret restore, browser-local persisted history, Ctrl+R reverse search, workspace recall - and sliding-context awareness (compaction summaries in recall/search, compaction notice with one-click /compact fill).",
    repo = "https://github.com/PerryLink/dsh-composer-history",
    homepage = "https://github.com/PerryLink/dsh-composer-history",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-composer-history",

        versions = {
            ["0.8.1"] = { commit = "04c639babf3b2aa94d4a3486647a1dcfbaa578de" },
        },
        latest = "0.8.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
