package = {
    spec = "1",

    name = "dsh-opencode-zen-free-provider",
    description = "OpenCode Zen 免费模型接入 DeepSeek Harness。1M 上下文，同步全部元数据",
    repo = "https://github.com/jiesou/dsh-opencode-zen-free-provider",
    homepage = "https://github.com/jiesou/dsh-opencode-zen-free-provider",
    licenses = {"MIT"},
    authors = {"jiesou"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@jiesou/dsh-opencode-zen-free-provider",

        versions = {
            ["0.1.27"] = { commit = "702f943bbecd667a8b7fcf92ec05d2dedaf90694" },
        },
        latest = "0.1.27",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
