package = {
    spec = "1",

    name = "dsh-aha-tutor",
    description = "开窍 · AI 私人老师：给 DeepSeek Harness 装一位私人老师，为你定制课程，在手写黑板上边写边讲。",
    repo = "https://github.com/BaronCyrus/dsh-aha-tutor",
    homepage = "https://github.com/BaronCyrus/dsh-aha-tutor",
    licenses = {"MIT"},
    authors = {"BaronCyrus"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-aha-tutor",

        versions = {
            ["1.15.0"] = { commit = "2ea4b402fb66b5d93b713ad474bf728b1cc0f9f4" },
        },
        latest = "1.15.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
