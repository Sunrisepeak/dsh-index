package = {
    spec = "1",

    name = "dsh-creator",
    description = "Jacky Creator：面向内容创作者的 DeepSeek Harness 本地内容与运营工作台",
    repo = "https://github.com/Jackywxsz/DSH-Creator",
    homepage = "https://github.com/Jackywxsz/DSH-Creator",
    licenses = {"MIT"},
    authors = {"Jackywxsz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "jacky-creator",

        versions = {
            ["0.1.0-beta.5"] = { commit = "c4fec1f947c0ba44aa6a1bb24ec8b1e3bdfd9bfa" },
        },
        latest = "0.1.0-beta.5",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
