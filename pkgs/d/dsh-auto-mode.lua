package = {
    spec = "1",

    name = "dsh-auto-mode",
    description = "Safe automatic permissions for DeepSeek Harness.",
    repo = "https://github.com/NanmiCoder/dsh-auto-mode",
    homepage = "https://github.com/NanmiCoder/dsh-auto-mode",
    licenses = {"MIT"},
    authors = {"NanmiCoder"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@nanmicoder/dsh-auto-mode",

        versions = {
            ["0.1.1"] = { commit = "c08c4e519f4c555360e8ff8b9974b6734d1b113e" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
