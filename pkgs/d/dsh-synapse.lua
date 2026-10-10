package = {
    spec = "1",

    name = "dsh-synapse",
    description = "A visual, non-linear conversation workspace plugin for DeepSeek Harness ; A canvas-based session explorer and branching workspace for DeepSeek Harness.",
    repo = "https://github.com/liangmianya/dsh-synapse",
    homepage = "https://github.com/liangmianya/dsh-synapse",
    licenses = {"MIT"},
    authors = {"liangmianya"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-synapse",

        versions = {
            ["0.3.0"] = { commit = "13af49f3742ed17bb9882e908331296861810f55" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
