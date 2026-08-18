package = {
    spec = "1",

    name = "deepseek-harness-zh-pro",
    description = "DeepSeek Harness (DSH) plugin:  A comprehensive enhancement plugin with UI polish, layout tweaks, prompt injection, and more.  综合性增强插件，界面优化、布局调整与提示词注入等更多功能。",
    repo = "https://github.com/magian1127/deepseek-harness-zh_pro",
    homepage = "https://github.com/magian1127/deepseek-harness-zh_pro",
    licenses = {"MIT"},
    authors = {"magian1127"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-harness-zh_pro",

        versions = {
            ["0.6.2"] = { commit = "05890ad02f8f9d8f558e75f6f662777549a80244" },
        },
        latest = "0.6.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
