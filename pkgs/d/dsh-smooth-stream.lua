package = {
    spec = "1",

    name = "dsh-smooth-stream",
    description = "DeepSeek Harness (dsh) plugin: silky streaming reveal, no flicker. dsh 丝滑流式渲染插件。",
    repo = "https://github.com/Laplace-bit/dsh-smooth-stream",
    homepage = "https://github.com/Laplace-bit/dsh-smooth-stream",
    licenses = {"MIT"},
    authors = {"Laplace-bit"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-smooth-stream",

        versions = {
            ["0.3.1"] = { commit = "7fc90154316a81ba05a2a20481eae5e7809a7bb9" },
        },
        latest = "0.3.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
