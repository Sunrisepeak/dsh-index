package = {
    spec = "1",

    name = "dsh-document-review",
    description = "DeepSeek Harness plugin: review Markdown documents in a local browser with annotations, replacements, and deletion suggestions. Supports single files and whole directories.",
    repo = "https://github.com/yabo083/dsh-document-review",
    homepage = "https://github.com/yabo083/dsh-document-review",
    licenses = {"MIT"},
    authors = {"yabo083"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-document-review",

        versions = {
            ["0.3.2"] = { commit = "2ce56a003288ce0ca9c4368bff45ab8c58d9e1da" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
