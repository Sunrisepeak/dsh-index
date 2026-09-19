package = {
    spec = "1",

    name = "dsh-spec-loop",
    description = "Spec-driven 开发闭环（OpenSpec 兼容）：/spec 命令族驱动 生成规格 → 批准 → 实现 → 逐条验收 → 归档 | Spec-driven dev loop (OpenSpec-compatible) for DeepSeek Harness: /spec drives propose → approve → implement → verify → archive",
    repo = "https://github.com/tianji-qingtian/dsh-spec-loop",
    homepage = "https://github.com/tianji-qingtian/dsh-spec-loop",
    licenses = {"MIT"},
    authors = {"tianji-qingtian"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-spec-loop",

        versions = {
            ["0.1.2"] = { commit = "9b86b909738fe3cd367d918e2c2260a9287eb549" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
