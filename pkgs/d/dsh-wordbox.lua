package = {
    spec = "1",

    name = "dsh-wordbox",
    description = "DSH Web GUI常用词箱子，方便项目常用词的存储和粘贴 | DSH Web GUI Common Words Box – for storing and pasting frequently used project terms.\"",
    repo = "https://github.com/arcmosin/dsh-wordbox",
    homepage = "https://github.com/arcmosin/dsh-wordbox",
    licenses = {"MIT"},
    authors = {"arcmosin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-wordbox",

        versions = {
            ["0.1.0"] = { commit = "747a6ef921e37df2ec9d194276efcf0d615ecb04" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
