package = {
    spec = "1",

    name = "dsh-plugin-development",
    description = "Portable Agent Skill for developing and auditing DeepSeek Harness plugins, with an optional profile-installable DSH bundle adapter.",
    repo = "https://github.com/w2112515/dsh-plugin-development",
    homepage = "https://github.com/w2112515/dsh-plugin-development",
    licenses = {"MIT"},
    authors = {"w2112515"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-development",

        versions = {
            ["0.2.0-beta.1"] = { commit = "4dab80cbeb86f706aa6fa9cc8269049aa809ccc9" },
        },
        latest = "0.2.0-beta.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
