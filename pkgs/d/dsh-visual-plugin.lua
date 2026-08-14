package = {
    spec = "1",

    name = "dsh-visual-plugin",
    description = "Dsh-visual-plugin.Give your text-only model eyes: forward user images to any OpenAI-compatible vision model and see the results in a Web UI right panel",
    repo = "https://github.com/jyh20030112/dsh-visual-plugin",
    homepage = "https://github.com/jyh20030112/dsh-visual-plugin",
    licenses = {"MIT"},
    authors = {"jyh20030112"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-visual-plugin",

        versions = {
            ["0.2.2"] = { commit = "0cac4a9549c171c7f17ec5252855efa40be35c91" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
