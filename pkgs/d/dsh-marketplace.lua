package = {
    spec = "1",

    name = "dsh-marketplace",
    description = "A safe, live plugin marketplace for DeepSeek Harness",
    repo = "https://github.com/ouyangyipeng/dsh-marketplace",
    homepage = "https://github.com/ouyangyipeng/dsh-marketplace",
    licenses = {"MIT"},
    authors = {"ouyangyipeng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-marketplace",

        versions = {
            ["0.1.1"] = { commit = "a319950489f8007351fe0eb772a763f5f18192c9" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
