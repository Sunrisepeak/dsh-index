package = {
    spec = "1",

    name = "dsh-effort-slider",
    description = "仿 Claude Code 推理等级滑块 DSH 插件",
    repo = "https://github.com/2768651338/dsh-effort-slider",
    homepage = "https://github.com/2768651338/dsh-effort-slider",
    licenses = {"BSD-3-Clause"},
    authors = {"2768651338"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-effort-slider",

        versions = {
            ["0.2.5"] = { commit = "b95d997a787ddfc2dfe05e167f59229ccd8bafb2" },
        },
        latest = "0.2.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
