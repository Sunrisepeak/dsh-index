package = {
    spec = "1",

    name = "dsh-notify-sound",
    description = "DSH (DeepSeek Harness) web plugin: plays a sound when the agent finishes replying (turn/end). Sound, volume and on/off configurable in Settings.",
    repo = "https://github.com/xxxxxxxyu/dsh-notify-sound",
    homepage = "https://github.com/xxxxxxxyu/dsh-notify-sound",
    licenses = {"MIT"},
    authors = {"xxxxxxxyu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-notify-sound",

        versions = {
            ["0.1.0"] = { commit = "1dd67bb9f53851f29b346e2da2fe064ef08ebcd6" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
