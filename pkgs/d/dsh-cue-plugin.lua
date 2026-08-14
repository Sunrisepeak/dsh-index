package = {
    spec = "1",

    name = "dsh-cue-plugin",
    description = "DeepSeek Harness 的跨会话引用(cue)插件",
    repo = "https://github.com/unnnnoooo/dsh-cue-plugin",
    homepage = "https://github.com/unnnnoooo/dsh-cue-plugin",
    authors = {"unnnnoooo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-cue-plugin",

        versions = {
            ["0.1.0"] = { commit = "dcb5a0c81f44500abf0e6203ab1a66d9013b60ac" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
