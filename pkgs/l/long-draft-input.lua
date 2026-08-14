package = {
    spec = "1",

    name = "long-draft-input",
    description = "Deepseek Harness 插件：用于聚合发送框长文本",
    repo = "https://github.com/Heyflyingpig/long-draft-input",
    homepage = "https://github.com/Heyflyingpig/long-draft-input",
    licenses = {"MIT"},
    authors = {"Heyflyingpig"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "long-draft-input",

        versions = {
            ["0.1.0"] = { commit = "3c69b87dcef07dc86ac075f078d6aa45e4a44c9d" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
