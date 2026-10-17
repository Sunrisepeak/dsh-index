package = {
    spec = "1",

    name = "dsh-im-companion",
    description = "dsh-im-companion：以助理和家的概念增强 dsh-im——哪个工作区有助理在管、在不在线尽收眼底，搬家拖一下就行。",
    repo = "https://github.com/FeatherHunter/dsh-im-companion",
    homepage = "https://github.com/FeatherHunter/dsh-im-companion",
    licenses = {"MIT"},
    authors = {"FeatherHunter"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-im-companion",

        versions = {
            ["0.2.8"] = { commit = "3b702d2a9ad8161e6cc43cca2a0efd13524cab8c" },
        },
        latest = "0.2.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
