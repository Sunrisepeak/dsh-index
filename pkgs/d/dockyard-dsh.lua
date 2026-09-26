package = {
    spec = "1",

    name = "dockyard-dsh",
    description = "A macOS-only native account-pool and provider plugin for DeepSeek Harness.",
    repo = "https://github.com/AITabby/dockyard-dsh",
    homepage = "https://github.com/AITabby/dockyard-dsh",
    licenses = {"MIT"},
    authors = {"AITabby"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dockyard-dsh/plugin",

        versions = {
            ["0.1.0"] = { commit = "d00afced663366368d6a296ef9eaad140c3bb4d5" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
