package = {
    spec = "1",

    name = "dsh-im-gateway",
    description = "An IM gateway for the DeepSeek Harness: bridge messengers into harness agent sessions and control them with slash commands.",
    repo = "https://github.com/jelech/dsh-im-gateway",
    homepage = "https://github.com/jelech/dsh-im-gateway",
    licenses = {"MIT"},
    authors = {"jelech"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-im-gateway",

        versions = {
            ["0.1.0"] = { commit = "684a93961c7fbedf10b787b48e44190a074da967" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
