package = {
    spec = "1",

    name = "dsh-context",
    description = "A DeepSeek Harness plugin for  Context insight dashboard — showing what the model's context window is made of and how it evolves.",
    repo = "https://github.com/bowenliang123/dsh-context",
    homepage = "https://github.com/bowenliang123/dsh-context",
    licenses = {"Apache-2.0"},
    authors = {"bowenliang123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-context",

        versions = {
            ["0.7.3"] = { commit = "c78345076f8034980507d368c48f74e96dd7c596" },
        },
        latest = "0.7.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
