package = {
    spec = "1",

    name = "dsh-pocket",
    description = "把 DeepSeek Harness 装进你的口袋：电脑上跑 dsh web，手机扫码即同步访问（局域网 + 公网，实时同屏）",
    repo = "https://github.com/shaobeichen/dsh-pocket",
    homepage = "https://github.com/shaobeichen/dsh-pocket",
    licenses = {"GPL-2.0"},
    authors = {"shaobeichen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-pocket",

        versions = {
            ["1.4.7"] = { commit = "959bfec5903eac8d851cbf19a9d5855f7fad8122" },
        },
        latest = "1.4.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
