package = {
    spec = "1",

    name = "dsh-redteam-model",
    description = "基于dsh web实现的多种模式，目的是服务于redteam进行授权的安全研究，覆盖渗透测试、红队评估、代码审计等范围领域，请勿用于非法行为。（允许二开，赋予模块各位自己的业务逻辑，不定期完善逻辑与修复bug）",
    repo = "https://github.com/SeaOf0/dsh-redteam-model",
    homepage = "https://github.com/SeaOf0/dsh-redteam-model",
    licenses = {"MIT"},
    authors = {"SeaOf0"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-redteam-model",

        versions = {
            ["1.1.0"] = { commit = "66cb56e35e19e411891aba5217f361619843c867" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
