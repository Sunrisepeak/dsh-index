package = {
    spec = "1",

    name = "dsh-meow-cachebilling",
    description = "一个能帮你省钱的插件！缓存其实比你想象的贵！换窗口可以省缓存钱，但换窗口有顾虑，或许你懒得重新描述项目和规则，或者你还需要那个上下文。所以这个插件，就是为了告诉你，当前轮，纯粹上下文缓存的部分，到底花了你多少钱。这样你才心里有个底，判断什么时候该换窗口。 在dsh-plugin标签里全网找了，那么多计费插件，并没有人写这一项……真奇怪，难道只有我有这个需求吗？",
    repo = "https://github.com/Phant0Meow/dsh-meow-cachebilling",
    homepage = "https://github.com/Phant0Meow/dsh-meow-cachebilling",
    licenses = {"MIT"},
    authors = {"Phant0Meow"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "meow-cachebilling",

        versions = {
            ["0.6.0"] = { commit = "c29df409555d82a16a0df33cda183482887353af" },
        },
        latest = "0.6.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
