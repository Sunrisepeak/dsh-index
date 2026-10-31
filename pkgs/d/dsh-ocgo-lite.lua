package = {
    spec = "1",

    name = "dsh-ocgo-lite",
    description = "OpenCode Go 用量常驻条：套餐余量圆环 + token/花费实时统计（本次会话/全部范围 + 按模型联动，官方实时定价），一键复制 API Key。OpenCode Go usage bar for DeepSeek Harness.",
    repo = "https://github.com/OK-wx/dsh-ocgo-lite",
    homepage = "https://github.com/OK-wx/dsh-ocgo-lite",
    licenses = {"MIT"},
    authors = {"OK-wx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ocgo-lite",

        versions = {
            ["0.1.0"] = { commit = "34423a70f2ac345f99305a21c72f61f5fb6a12fa" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
