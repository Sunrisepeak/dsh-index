package = {
    spec = "1",

    name = "write-chinese-long-screenplay",
    description = "中文电影与剧集长剧本写作 skill",
    repo = "https://github.com/mudden2380078550-creator/write-chinese-long-screenplay",
    homepage = "https://github.com/mudden2380078550-creator/write-chinese-long-screenplay",
    licenses = {"GPL-3.0"},
    authors = {"mudden2380078550-creator"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "scene",

        bundle_name = "write-chinese-long-screenplay",

        versions = {
            ["0.2.0"] = { commit = "e03ef9dee2d1974f5138c744b83a76f42ac2b207" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
