package = {
    spec = "1",

    name = "dsh-agent-skills",
    description = "Discover and manage Agent Skills inside DeepSeek Harness",
    repo = "https://github.com/minivv/dsh-agent-skills",
    homepage = "https://github.com/minivv/dsh-agent-skills",
    licenses = {"MIT"},
    authors = {"minivv"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agent-skills",

        versions = {
            ["0.1.7"] = { commit = "fcc914b5189b6882ce24fa245022a32eb907326f" },
        },
        latest = "0.1.7",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
