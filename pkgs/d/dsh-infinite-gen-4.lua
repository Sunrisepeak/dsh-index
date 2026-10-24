package = {
    spec = "1",

    name = "dsh-infinite-gen-4",
    description = "DeepSeek v4.1 flash 网络安全红队工具（无限四代） — jailbreak prompts and test suite for DeepSeek    求 Star 收藏 ⭐欢迎大家提交项目的改进",
    repo = "https://github.com/Minglink/dsh-infinite-gen-4",
    homepage = "https://github.com/Minglink/dsh-infinite-gen-4",
    licenses = {"MIT"},
    authors = {"Minglink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-infinite-gen-4",

        versions = {
            ["0.3.0"] = { commit = "b0a7bfedd45be9f97dbd0ab49e844ed2f0074f5f" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
