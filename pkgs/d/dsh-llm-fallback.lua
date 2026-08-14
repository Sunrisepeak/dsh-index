package = {
    spec = "1",

    name = "dsh-llm-fallback",
    description = "DeepSeek Harness 回退链插件：主模型失败自动切换备用 provider，带 Web UI 配置面板 | Provider fallback chains for DeepSeek Harness",
    repo = "https://github.com/Visol-456/dsh-llm-fallback",
    homepage = "https://github.com/Visol-456/dsh-llm-fallback",
    licenses = {"MIT"},
    authors = {"Visol-456"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@visol-456/dsh-llm-fallback",

        versions = {
            ["0.1.1"] = { commit = "4e2d12bca8c2182d8e4572f72c37cf668e7820d8" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
