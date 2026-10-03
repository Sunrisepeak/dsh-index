package = {
    spec = "1",

    name = "dsh-opencode-zen",
    description = "0 元接入 6 个免费大模型：OpenCode Zen 免费档模型零配置接入 DeepSeek Harness，免注册免充值，内置 6 个免费模型，多 Key 轮换与限流退避。",
    repo = "https://github.com/xiaozhe7772222/dsh-opencode-zen",
    homepage = "https://github.com/xiaozhe7772222/dsh-opencode-zen",
    licenses = {"MIT"},
    authors = {"xiaozhe7772222"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-opencode-zen",

        versions = {
            ["0.1.0"] = { commit = "62e90514d64aaf3920a27e7fab6678e13ccf810a" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
