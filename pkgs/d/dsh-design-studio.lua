package = {
    spec = "1",

    name = "dsh-design-studio",
    description = "DSH 设计工作台：模型画的界面摆上画布，点一下就改，还有设计市场。 · Design canvas for DeepSeek Harness (DSH): web, app, mini program and desktop screens in device frames, click or draw to edit, a design market of templates, export and code handoff (React / Vue / uni-app).",
    repo = "https://github.com/OrderG-X/dsh-design-studio",
    homepage = "https://github.com/OrderG-X/dsh-design-studio",
    licenses = {"MIT"},
    authors = {"OrderG-X"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-design-studio",

        versions = {
            ["0.16.1"] = { commit = "7d5e427c09d45a6c602a7693b765127ab251a776" },
        },
        latest = "0.16.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
