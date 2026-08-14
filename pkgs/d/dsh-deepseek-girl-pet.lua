package = {
    spec = "1",

    name = "dsh-deepseek-girl-pet",
    description = "Animated deepseek girl desktop pet plugin for DeepSeek Harness",
    repo = "https://github.com/f0909172434/dsh-deepseek-girl-pet",
    homepage = "https://github.com/f0909172434/dsh-deepseek-girl-pet",
    licenses = {"MIT"},
    authors = {"f0909172434"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-deepseek-girl-pet",

        versions = {
            ["0.1.1"] = { commit = "c96029f7f05adf78931c934d01974ae70527e911" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
