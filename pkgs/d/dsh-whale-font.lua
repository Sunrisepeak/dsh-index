package = {
    spec = "1",

    name = "dsh-whale-font",
    description = "把 DeepSeek Harness 对话里的主语人称「我/你/I/me」渲染成 DeepSeek 蓝鲸图标（DSH 插件）",
    repo = "https://github.com/kxSenlin/dsh-whale-font",
    homepage = "https://github.com/kxSenlin/dsh-whale-font",
    licenses = {"MIT"},
    authors = {"kxSenlin"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-whale-font",

        versions = {
            ["1.0.0"] = { commit = "5af44a659d1cb7aab42a42b6d9080ae5beeae33d" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
