package = {
    spec = "1",

    name = "dsh-xdpool",
    description = "把你能白嫖的模型额度接进 DSH 同一个池：WorkBuddy 多账号自动容错、十三家扫码登录、76 家免费额度聚合、用量看板、模型路由、本地 OpenAI 网关、积分自动化。",
    repo = "https://github.com/XDTrees/dsh-xdpool",
    homepage = "https://github.com/XDTrees/dsh-xdpool",
    licenses = {"MIT"},
    authors = {"XDTrees"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-xdpool",

        versions = {
            ["2.2.1"] = { commit = "839b94d2dbca60572c26acb11a0b47c734985f9f" },
        },
        latest = "2.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
