package = {
    spec = "1",

    name = "dsh-webchatlike",
    description = "Web-chat style message actions for DeepSeek Harness: edit your prompt, regenerate answers, and flip versions with a deepseek.com-style <i/N> pager. Deepseek网页版/app聊天体验插件",
    repo = "https://github.com/cindyguyuehu123/dsh-webchatlike",
    homepage = "https://github.com/cindyguyuehu123/dsh-webchatlike",
    licenses = {"MIT"},
    authors = {"cindyguyuehu123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-webchatlike",

        versions = {
            ["0.1.0"] = { commit = "eac303686f125636cdda03dd9cdef87213a35913" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
