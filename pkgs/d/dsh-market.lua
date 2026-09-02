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
            ["1.40.0"] = { commit = "492c39f00e98fcf9bb6a5f78bc42b71450050590" },
            ["1.39.0"] = { commit = "ee95b359c818ab9b8c3cf86a46e20757d72fdc63" },
            ["1.38.1"] = { commit = "d71bc4ad027af9a144c66e405e084d8f590b18c5" },
            ["1.38.0"] = { commit = "8e0650f07de7775b146838fb37e3180e429773ec" },
            ["1.36.0"] = { commit = "d5902420b1759f9620fe1042aedec7c3325d2ac5" },
            ["1.34.0"] = { commit = "bb3f91454bbdd05260a2bba7d2a1201ee28554eb" },
            ["1.29.3"] = { commit = "df83b0df7b0232b46578af9b564c24af2bc4b8c3" },
            ["1.28.0"] = { commit = "8a3d95de86b23c783b29808e26505e4250002587" },
            ["1.21.2"] = { commit = "bb0f128ad14ee5de383412a817d53e21e6a0d7c6" },
            ["1.19.0-beta.3"] = { commit = "45efabf16ae4508cdfb323110afb9cfa0a6dcafa" },
            ["1.18.0"] = { commit = "b9323cc85d0148013384a5aca5215be1922eea36" },
            ["1.16.5"] = { commit = "a6e053b334b90b25cf2d830230ebef673020f383" },
            ["1.15.0"] = { commit = "eca19a156c9fb7ee8982ebe295f9f1a3647e1843" },
            ["1.14.1"] = { commit = "f4a993fa40a285606670ef29011e2f44b971fd5e" },
            ["1.12.1"] = { commit = "ce4445f568b13b93fbf235d07bc54b1bb74b6b77" },
            ["1.11.0"] = { commit = "d19ecfd583360edccad7a3e5bb6919e876a9ee59" },
            ["1.8.0"] = { commit = "94d7712e7188b746a92d223176a4314a69bd5675" },
            ["1.2.4"] = { commit = "cd2f016076cf9c349114ae796e00c48078d8104c" },
            ["1.2.2"] = { commit = "67a66a4e7cd6c344772ce38846b99f6a79074052" },
        },
        latest = "1.40.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
