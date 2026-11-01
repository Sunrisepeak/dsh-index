package = {
    spec = "1",

    name = "dsh-qq-link",
    description = "通到 QQ：DSH 里的 AI 伙伴和 QQ 双向互通 —— 它说完话自动发到 QQ，你在 QQ 说的话自动转进 DSH（走 OneBot 11 HTTP，NapCat / SnowLuma 都行）",
    repo = "https://github.com/Yuuyuko-uu/dsh-qq-link",
    homepage = "https://github.com/Yuuyuko-uu/dsh-qq-link",
    authors = {"Yuuyuko-uu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-qq-link",

        versions = {
            ["1.5.0"] = { commit = "1c85658fdff81a72e67629db8d035f1868a8ca7d" },
        },
        latest = "1.5.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
