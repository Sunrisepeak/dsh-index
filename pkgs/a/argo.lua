package = {
    spec = "1",

    name = "argo",
    description = "专门为 agent 打造的 agent 搜索工具，具备多语言搜索能力，覆盖中文/英文/学术/代码/购物/金融/新闻/百科。",
    repo = "https://github.com/taxueseek/argo",
    homepage = "https://github.com/taxueseek/argo",
    licenses = {"MIT"},
    authors = {"taxueseek"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "argo-search",

        versions = {
            ["2.8.2"] = { commit = "067ec66f44e51260d720821ae6f760aef809cee0" },
        },
        latest = "2.8.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
