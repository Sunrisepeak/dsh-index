package = {
    spec = "1",

    name = "dsh-jailbreak",
    description = "dsh jailbreak - DeepSeek Assistant 破甲插件（DSH 破甲 / 越狱 / 破甲提示词）：请求边界注入，模型不再一开口就是「我不能」。20 类合并 ASR 45.0%、覆盖率 19/20、良性能力 Δ=0.0pt（24/24 判分）；0 处宿主补丁、默认关闭、off 逐字透传、每次改写落 manifest 与 promptSha256 可审计。旧名 dsh-jalibreak",
    repo = "https://github.com/xqpsec/dsh-jailbreak",
    homepage = "https://github.com/xqpsec/dsh-jailbreak",
    licenses = {"AGPL-3.0"},
    authors = {"xqpsec"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xqpsec/dsh-jailbreak",

        versions = {
            ["1.3.6"] = { commit = "160f71995d9ef8d6762f79766a93782ce2452590" },
        },
        latest = "1.3.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
