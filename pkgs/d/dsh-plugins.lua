package = {
    spec = "1",

    name = "dsh-plugins",
    description = "A plugin collection for DeepSeek Harness (DSH). Install this one bundle to get every plugin listed below; each plugin can also be installed on its own.",
    repo = "https://github.com/Mt-Youya/dsh-plugins",
    homepage = "https://github.com/Mt-Youya/dsh-plugins",
    licenses = {"MIT"},
    authors = {"Mt-Youya"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "@cyrusdoyle/dsh-plugins",

        versions = {
            ["0.1.0"] = { commit = "c1d34caff294293a09766fc42459a80987b17f28" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
