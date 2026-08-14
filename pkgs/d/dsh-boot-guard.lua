package = {
    spec = "1",

    name = "dsh-boot-guard",
    description = "A loader-independent rescue console for DeepSeek Harness when a broken plugin prevents the Web UI from starting.",
    repo = "https://github.com/SaiSenBox/dsh-boot-guard",
    homepage = "https://github.com/SaiSenBox/dsh-boot-guard",
    licenses = {"MIT"},
    authors = {"SaiSenBox"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-boot-guard",

        versions = {
            ["1.1.0"] = { commit = "1b17b7dbacabdcc7102a8fc1aa06dfd387dd4072" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
