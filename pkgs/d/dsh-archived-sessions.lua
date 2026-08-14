package = {
    spec = "1",

    name = "dsh-archived-sessions",
    description = "DSH Session Manager: manage conversations, archive/restore, delete safely, open record folders.",
    repo = "https://github.com/Zephyr-vibe/dsh-archived-sessions",
    homepage = "https://github.com/Zephyr-vibe/dsh-archived-sessions",
    licenses = {"MIT"},
    authors = {"Zephyr-vibe"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-archived-sessions",

        versions = {
            ["0.1.2"] = { commit = "a1c6fc99951c2274efd55396a768f9d339fffac7" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
