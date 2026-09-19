package = {
    spec = "1",

    name = "dsh-file-mentions",
    description = "Clickable file paths in DSH replies: Codex-style inline open, 📂 reveal in file manager, mentioned-files chip list. DSH web plugin (zero-dependency).",
    repo = "https://github.com/a903067276-rgb/dsh-file-mentions",
    homepage = "https://github.com/a903067276-rgb/dsh-file-mentions",
    licenses = {"MIT"},
    authors = {"a903067276-rgb"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-file-mentions",

        versions = {
            ["1.0.3"] = { commit = "4bd43b55d9ea3f9630036e95ba3c481981ac6f63" },
        },
        latest = "1.0.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
