package = {
    spec = "1",

    name = "dsh-whale-catch",
    description = "深海鱼篓：不用 agent 登记，自动收进本场会话产出的文件——右侧栏预览、一键打包 zip、归档。Zero-registration deliverable basket for DeepSeek Harness.",
    repo = "https://github.com/Rosynb666/dsh-whale-catch",
    homepage = "https://github.com/Rosynb666/dsh-whale-catch",
    licenses = {"MIT"},
    authors = {"Rosynb666"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-whale-catch",

        versions = {
            ["0.1.2"] = { commit = "150e0e74822a3df67ed64eccf273b82da139b812" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
