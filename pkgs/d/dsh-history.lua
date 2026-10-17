package = {
    spec = "1",

    name = "dsh-history",
    description = "Quickly view, search, and jump to all the messages you sent in a long conversation.",
    repo = "https://github.com/chenproton/dsh-history",
    homepage = "https://github.com/chenproton/dsh-history",
    licenses = {"MIT"},
    authors = {"chenproton"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-history",

        versions = {
            ["0.1.24"] = { commit = "0dd37138713aeb61cc2dc9ced6ef6932df2917ec" },
        },
        latest = "0.1.24",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
