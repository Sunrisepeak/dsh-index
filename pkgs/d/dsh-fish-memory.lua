package = {
    spec = "1",

    name = "dsh-fish-memory",
    description = "🐋 DSH 鱼的记忆：给会话一份会淡忘的长期记忆，每条都带时间。名字里的「鱼」来自 DeepSeek 的鲸鱼。",
    repo = "https://github.com/Yuuyuko-uu/dsh-fish-memory",
    homepage = "https://github.com/Yuuyuko-uu/dsh-fish-memory",
    licenses = {"MIT"},
    authors = {"Yuuyuko-uu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "desktop",

        bundle_name = "dsh-fish-memory",

        versions = {
            ["1.2.2"] = { commit = "b49938f77b36b8610d061d3a24f2d6ca95214044" },
        },
        latest = "1.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
