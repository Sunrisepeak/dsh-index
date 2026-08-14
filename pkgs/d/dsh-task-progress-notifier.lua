package = {
    spec = "1",

    name = "dsh-task-progress-notifier",
    description = "dsh-task-progress-notifier",
    repo = "https://github.com/sjscy05/dsh-task-progress-notifier",
    homepage = "https://github.com/sjscy05/dsh-task-progress-notifier",
    licenses = {"MIT"},
    authors = {"sjscy05"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-task-progress-notifier",

        versions = {
            ["0.1.0"] = { commit = "64f9df96c2b8d176b3eedaf3a1a509de8106bfb7" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
