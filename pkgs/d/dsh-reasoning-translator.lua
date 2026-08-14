package = {
    spec = "1",

    name = "dsh-reasoning-translator",
    description = "DeepSeek Harness plugin: make the model write its chain-of-thought in your language",
    repo = "https://github.com/pinkllo/dsh-reasoning-translator",
    homepage = "https://github.com/pinkllo/dsh-reasoning-translator",
    licenses = {"MIT"},
    authors = {"pinkllo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-reasoning-translator",

        versions = {
            ["0.1.0"] = { commit = "5f87acf6917d3a15439a934a771d8a98c902f2a0" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
