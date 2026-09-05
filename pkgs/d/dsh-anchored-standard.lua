package = {
    spec = "1",

    name = "dsh-anchored-standard",
    description = "Two-phase DeepSeek Harness preset: Minimal-aligned bootstrap (bash+read), then full Standard tools after the first tool call or reply",
    repo = "https://github.com/Jungod1121/dsh-anchored-standard",
    homepage = "https://github.com/Jungod1121/dsh-anchored-standard",
    licenses = {"MIT"},
    authors = {"Jungod1121"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-anchored-standard",

        versions = {
            ["1.2.1"] = { commit = "560530f0e1af6dba3528ac8962f5e5e63951b1bb" },
        },
        latest = "1.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
