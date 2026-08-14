package = {
    spec = "1",

    name = "dsh-sidebar-qa",
    description = "一个基于DSH-better-sidebar的侧边栏提问tab，实现类codex的侧边提问或claude code的/btw功能",
    repo = "https://github.com/ChenRuoT/dsh-sidebar-qa",
    homepage = "https://github.com/ChenRuoT/dsh-sidebar-qa",
    licenses = {"MIT"},
    authors = {"ChenRuoT"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-sidebar-qa",

        versions = {
            ["0.1.0"] = { commit = "76321fd6d3582eb300248e81aca336f3839f203d" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
