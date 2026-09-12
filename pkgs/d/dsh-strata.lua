package = {
    spec = "1",

    name = "dsh-strata",
    description = "Session strata for the DeepSeek Harness Web GUI: the transcript's scrollbar becomes a to-scale, colour-coded map of the whole run, with your own messages emphasised and clickable anchors.",
    repo = "https://github.com/jsdvjx/dsh-strata",
    homepage = "https://github.com/jsdvjx/dsh-strata",
    licenses = {"MIT"},
    authors = {"jsdvjx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-strata",

        versions = {
            ["0.8.2"] = { commit = "e6690b39569f5b0fba992b9d80518d13cb74061a" },
        },
        latest = "0.8.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
