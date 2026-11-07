package = {
    spec = "1",

    name = "dsh-science",
    description = "dsh-science",
    repo = "https://github.com/biociao/dsh-science",
    homepage = "https://github.com/biociao/dsh-science",
    licenses = {"MIT"},
    authors = {"biociao"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-science",

        versions = {
            ["0.1.0"] = { commit = "ef7ef5ad4b78c8a58b2545afe33bc17d60d72f95" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
