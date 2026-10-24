package = {
    spec = "1",

    name = "dsh-loop-guard",
    description = "为 DeepSeek Harness（DSH）提供的思考循环守护插件：模型陷入「只想不做」的退化循环时自动打断并注入纠正提示，任务继续往下走，不必再手动中止",
    repo = "https://github.com/MrWeiCodes/dsh-loop-guard",
    homepage = "https://github.com/MrWeiCodes/dsh-loop-guard",
    licenses = {"MIT"},
    authors = {"MrWeiCodes"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@mrweicodes/dsh-loop-guard",

        versions = {
            ["1.0.9"] = { commit = "fd5b9b65af7135129fb3c5d78b4f4fc3dc6362ea" },
        },
        latest = "1.0.9",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
