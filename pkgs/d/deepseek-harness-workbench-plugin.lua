package = {
    spec = "1",

    name = "deepseek-harness-workbench-plugin",
    description = "Deepseek-harness-workbench-plugin",
    repo = "https://github.com/loadingvx/deepseek-harness-workbench-plugin",
    homepage = "https://github.com/loadingvx/deepseek-harness-workbench-plugin",
    licenses = {"MIT"},
    authors = {"loadingvx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-workbench-plugin",

        versions = {
            ["0.1.14"] = { commit = "799c31a4385a8beb4a3b8565cbc5d1d069e3b5ae" },
        },
        latest = "0.1.14",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
