package = {
    spec = "1",

    name = "dsh-doublecheck",
    description = "Double-check before you ship: grill the requirements, test the implementation, prove the delivery. An engineering-discipline bundle for DeepSeek Harness.",
    repo = "https://github.com/PerryLink/dsh-doublecheck",
    homepage = "https://github.com/PerryLink/dsh-doublecheck",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-doublecheck",

        versions = {
            ["0.9.1"] = { commit = "b37280bd9b5672546012d148cea6316afce6e45d" },
        },
        latest = "0.9.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
