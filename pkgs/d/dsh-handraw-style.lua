package = {
    spec = "1",

    name = "dsh-handraw-style",
    description = "DSH 图像创作工作台插件：单张/套图/封面/知识卡，共享画风、配色、版式、人物与姿势素材",
    repo = "https://github.com/yang0/dsh-handraw-style",
    homepage = "https://github.com/yang0/dsh-handraw-style",
    authors = {"yang0"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-pose-studio",

        versions = {
            ["0.7.9"] = { commit = "6ba594bef757eeb2718f87d52ca529ba9caa1212" },
        },
        latest = "0.7.9",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
