package = {
    spec = "1",

    name = "dsh-zh-output",
    description = "DeepSeek Harness 中文输出插件：强制中文思考与输出的中文预设",
    repo = "https://github.com/YKennen/dsh-zh-output",
    homepage = "https://github.com/YKennen/dsh-zh-output",
    licenses = {"MIT"},
    authors = {"YKennen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-zh-output",

        versions = {
            ["0.1.0"] = { commit = "98a4ef7aa6a75116451374267053737f2b670e4f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
