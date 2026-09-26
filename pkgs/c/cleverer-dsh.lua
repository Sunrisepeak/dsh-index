package = {
    spec = "1",

    name = "cleverer-dsh",
    description = "DSH execution-discipline plugin suite: 11 plugins + 6 skills, zero dependencies, 426 tests. 让 DeepSeek Harness 变聪明的插件套件。",
    repo = "https://github.com/Classicoke/cleverer-dsh",
    homepage = "https://github.com/Classicoke/cleverer-dsh",
    licenses = {"MIT"},
    authors = {"Classicoke"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "cleverer-dsh",

        versions = {
            ["1.2.0"] = { commit = "40bd216ea9c7a95da887aa97fb661a0e8c7b1dd2" },
        },
        latest = "1.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
