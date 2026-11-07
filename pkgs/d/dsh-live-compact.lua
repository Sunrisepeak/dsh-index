package = {
    spec = "1",

    name = "dsh-live-compact",
    description = "边做边压 Live Compact. Compress the finished turn in place and keep the prefix cache.",
    repo = "https://github.com/MerkyorLynn/dsh-live-compact",
    homepage = "https://github.com/MerkyorLynn/dsh-live-compact",
    licenses = {"MIT"},
    authors = {"MerkyorLynn"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-live-compact",

        versions = {
            ["1.0.5"] = { commit = "9a5601703fcd346d44a56f1ef7ff71cdf9862d94" },
        },
        latest = "1.0.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
