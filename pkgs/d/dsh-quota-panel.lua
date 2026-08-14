package = {
    spec = "1",

    name = "dsh-quota-panel",
    description = "Provider quota/balance corner panel for the dsh web surface (DeepSeek Harness plugin): server-side credential proxies plus a config-driven page badge.",
    repo = "https://github.com/brittanistrehlowll-oss/dsh-quota-panel",
    homepage = "https://github.com/brittanistrehlowll-oss/dsh-quota-panel",
    licenses = {"MIT"},
    authors = {"brittanistrehlowll-oss"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-quota-panel",

        versions = {
            ["0.3.0"] = { commit = "18cfc7f5b52bd1dfa2a6571376fa106b3973bacd" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
