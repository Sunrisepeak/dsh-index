package = {
    spec = "1",

    name = "dsh-feishu-bridge",
    description = "Feishu (Lark) channel bridge for DeepSeek Harness (dsh) — message a Feishu bot, it runs a dsh agent turn, the reply comes back. Community plugin.",
    repo = "https://github.com/wz-heng/dsh-feishu-bridge",
    homepage = "https://github.com/wz-heng/dsh-feishu-bridge",
    licenses = {"MIT"},
    authors = {"wz-heng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-feishu-bridge",

        versions = {
            ["0.1.0"] = { commit = "3107fd0c69225b3e136d31ce2dac2a41d01c68a8" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
