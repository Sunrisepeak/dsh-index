package = {
    spec = "1",

    name = "dsh-market",
    description = "The plugin market inside DeepSeek Harness — browse, search, one-click install · DSH 可视化插件市场",
    repo = "https://github.com/dsh-market/dsh-market",
    homepage = "https://github.com/dsh-market/dsh-market",
    authors = {"dsh-market"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dshmarket",

        versions = {
            ["1.15.0"] = { commit = "eca19a156c9fb7ee8982ebe295f9f1a3647e1843" },
            ["1.14.1"] = { commit = "f4a993fa40a285606670ef29011e2f44b971fd5e" },
            ["1.12.1"] = { commit = "ce4445f568b13b93fbf235d07bc54b1bb74b6b77" },
            ["1.11.0"] = { commit = "d19ecfd583360edccad7a3e5bb6919e876a9ee59" },
            ["1.8.0"] = { commit = "94d7712e7188b746a92d223176a4314a69bd5675" },
            ["1.2.4"] = { commit = "cd2f016076cf9c349114ae796e00c48078d8104c" },
            ["1.2.2"] = { commit = "67a66a4e7cd6c344772ce38846b99f6a79074052" },
        },
        latest = "1.15.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
