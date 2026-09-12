package = {
    spec = "1",

    name = "oh-my-dsh",
    description = "Oh My DSH (DSH Autopilot): durable, bounded autonomous development for DeepSeek Harness",
    repo = "https://github.com/LiuMengxuan04/oh-my-dsh",
    homepage = "https://github.com/LiuMengxuan04/oh-my-dsh",
    licenses = {"MIT"},
    authors = {"LiuMengxuan04"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-autopilot",

        versions = {
            ["0.1.0-alpha.3"] = { commit = "fa770d7ab2a5a393952d7e11ed59d016e7ccaa55" },
        },
        latest = "0.1.0-alpha.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
