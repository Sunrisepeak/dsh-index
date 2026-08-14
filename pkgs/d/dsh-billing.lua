package = {
    spec = "1",

    name = "dsh-billing",
    description = "DeepSeek Harness plugin: 账户余额 + 会话费用（/balance /cost 命令、deepseek_billing 工具、Web UI 双胶囊），官方价格每 12 小时自动同步",
    repo = "https://github.com/TheTianzz/dsh-billing",
    homepage = "https://github.com/TheTianzz/dsh-billing",
    licenses = {"MIT"},
    authors = {"TheTianzz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-billing",

        versions = {
            ["0.4.1"] = { commit = "af0a8e40dbe34f8e80fa116eb28132d85698606f" },
        },
        latest = "0.4.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
