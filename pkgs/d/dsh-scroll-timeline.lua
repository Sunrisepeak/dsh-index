package = {
    spec = "1",

    name = "dsh-scroll-timeline",
    description = "DSH web plugin: ChatGPT-style scroll timeline on the chat sidebar — magnetic mountain hover, click to jump to user messages. Derived from vlln/dsh-navbar (MIT).",
    repo = "https://github.com/invalidnaaaame/dsh-scroll-timeline",
    homepage = "https://github.com/invalidnaaaame/dsh-scroll-timeline",
    licenses = {"MIT"},
    authors = {"invalidnaaaame"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-scroll-timeline",

        versions = {
            ["0.1.0"] = { commit = "7d92d59e427866dea3637ef97683940761a66541" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
