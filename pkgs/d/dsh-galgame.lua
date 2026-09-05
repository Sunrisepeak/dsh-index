package = {
    spec = "1",

    name = "dsh-galgame",
    description = "我要成为Galgame高手！！将你的Vibe coding界面修改成为Galgame的样子，在不影响工作的情况下和赏心悦目的DeepSeek娘进行友好互动",
    repo = "https://github.com/Lanxing6480/dsh-galgame",
    homepage = "https://github.com/Lanxing6480/dsh-galgame",
    authors = {"Lanxing6480"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@lanxing/dsh-galgame",

        versions = {
            ["1.1.0"] = { commit = "5dba67b691fc024db848db615792d69ef7ba5807" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
