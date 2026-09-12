package = {
    spec = "1",

    name = "dsh-meow-smooth",
    description = "手机电脑dsh通知功能！移动端可用的通知！手机端ui交互优化！让手机端dsh真正可用。",
    repo = "https://github.com/Phant0Meow/dsh-meow-smooth",
    homepage = "https://github.com/Phant0Meow/dsh-meow-smooth",
    licenses = {"MIT"},
    authors = {"Phant0Meow"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "meow-smooth",

        versions = {
            ["0.4.0"] = { commit = "5177786ebfa082ff308fd6a5b7088f4461e89324" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
