package = {
    spec = "1",

    name = "dsh-familiar-memory",
    description = "给 DeepSeek Harness 的本地记忆层：养大肥鱼的可以下载来玩，经过测试下载之后比单纯用RAG和外部记忆库更有人情味更自然了。",
    repo = "https://github.com/Elio896/dsh-familiar-memory",
    homepage = "https://github.com/Elio896/dsh-familiar-memory",
    licenses = {"MIT"},
    authors = {"Elio896"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-neuron-memory",

        versions = {
            ["0.2.0"] = { commit = "583a7eef394b5704209773b44ee29ab93dae2c97" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
