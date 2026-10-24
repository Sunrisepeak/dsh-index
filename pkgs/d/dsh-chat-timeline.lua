package = {
    spec = "1",

    name = "dsh-chat-timeline",
    description = "1:1 port of DeepSeek's official web right-side chat navigation rail (ScrollNav) as a DeepSeek Harness (DSH) plugin",
    repo = "https://github.com/jjxjjjjiik-bot/dsh-chat-timeline",
    homepage = "https://github.com/jjxjjjjiik-bot/dsh-chat-timeline",
    licenses = {"MIT"},
    authors = {"jjxjjjjiik-bot"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-chat-timeline",

        versions = {
            ["0.1.2"] = { commit = "2bf071ff53c959c82784ee42b6d109d281ea6125" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
