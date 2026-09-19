package = {
    spec = "1",

    name = "dsh-harmony",
    description = "A library for patching, replacing and decorating dsh plugin during runtime",
    repo = "https://github.com/CH4ACKO3/dsh-harmony",
    homepage = "https://github.com/CH4ACKO3/dsh-harmony",
    licenses = {"MIT"},
    authors = {"CH4ACKO3"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-harmony",

        versions = {
            ["0.3.2"] = { commit = "ad945276cfd94dd650fa28c680b0aeb326697623" },
        },
        latest = "0.3.2",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
