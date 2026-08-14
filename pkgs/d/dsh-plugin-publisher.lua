package = {
    spec = "1",

    name = "dsh-plugin-publisher",
    description = "DSH 插件开发与 GitHub 发布工作流技能插件 (consent-gated) — develop, verify, publish & marketplace-visible DSH plugins",
    repo = "https://github.com/akira399/dsh-plugin-publisher",
    homepage = "https://github.com/akira399/dsh-plugin-publisher",
    licenses = {"MIT"},
    authors = {"akira399"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-publisher",

        versions = {
            ["1.4.0"] = { commit = "ea765a7b714a048b7426c68e7ee61d0ac7c84cab" },
        },
        latest = "1.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
