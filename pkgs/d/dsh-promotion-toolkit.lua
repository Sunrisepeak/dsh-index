package = {
    spec = "1",

    name = "dsh-promotion-toolkit",
    description = "把你的任何想法，变成每个平台原生的宣发内容 | Turn any idea into platform-native publicity",
    repo = "https://github.com/lhmd/dsh-promotion-toolkit",
    homepage = "https://github.com/lhmd/dsh-promotion-toolkit",
    licenses = {"MIT"},
    authors = {"lhmd"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@lhmd/dsh-promotion-toolkit",

        versions = {
            ["0.1.0"] = { commit = "c4e19742d4399e0282ab70829e412fb47bbb42a7" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
