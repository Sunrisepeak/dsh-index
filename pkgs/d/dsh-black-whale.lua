package = {
    spec = "1",

    name = "dsh-black-whale",
    description = "DeepSeek Harness 黑鲸实验室主题：官网黑鲸 × 夕小瑶 IP，真实 profile 可安装的 Web UI 插件",
    repo = "https://github.com/147228/dsh-black-whale",
    homepage = "https://github.com/147228/dsh-black-whale",
    authors = {"147228"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@xiaoyao-ai/dsh-client-ui-skin-black-whale",

        versions = {
            ["0.1.3"] = { commit = "4f7816e6f24a76f8e99eb0c23686eaf1a34d0862" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
