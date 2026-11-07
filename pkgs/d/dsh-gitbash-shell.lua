package = {
    spec = "1",

    name = "dsh-gitbash-shell",
    description = "DSH plugin: Git Bash shell for all agent modes on Windows (replaces pwsh executor)",
    repo = "https://github.com/KannaKuron/dsh-gitbash-shell",
    homepage = "https://github.com/KannaKuron/dsh-gitbash-shell",
    licenses = {"MIT"},
    authors = {"KannaKuron"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-gitbash-shell",

        versions = {
            ["0.24.2"] = { commit = "94e03b0aa498bd6fba4d19044d94d892b9369e75" },
        },
        latest = "0.24.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
