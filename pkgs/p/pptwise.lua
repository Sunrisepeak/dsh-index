package = {
    spec = "1",

    name = "pptwise",
    description = "A real PowerPoint, not a picture or HTML. Tell your AI what to cover and pptwise builds an editable deck on your own machine. Agent skill + DSH plugin, no account and no API key to render. | 真正的 PPT，不是图片也不是 HTML。跟 AI 说要讲什么，pptwise 在你自己电脑上做出一份能改的 PPT。Agent skill + DSH 插件，不用注册，渲染不用 API key。",
    repo = "https://github.com/liustack/pptwise",
    homepage = "https://github.com/liustack/pptwise",
    licenses = {"MIT"},
    authors = {"liustack"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@liustack/pptwise",

        versions = {
            ["0.35.0"] = { commit = "fa2444bc45396d4fcf987891b332f5ac0e5933b6" },
        },
        latest = "0.35.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
