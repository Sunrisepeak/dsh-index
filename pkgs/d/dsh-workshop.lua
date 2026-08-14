package = {
    spec = "1",

    name = "dsh-workshop",
    description = "Steam Workshop style plugin store for DeepSeek Harness Web UI: browse 850+ community plugins, one-click install with GitHub mirror acceleration, progress UI, security checks, Chinese descriptions",
    repo = "https://github.com/loguhan/dsh-workshop",
    homepage = "https://github.com/loguhan/dsh-workshop",
    licenses = {"MIT"},
    authors = {"loguhan"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-workshop",

        versions = {
            ["0.1.0"] = { commit = "cf36f61f708100d9f2c67db3a1722a8b85b53757" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
