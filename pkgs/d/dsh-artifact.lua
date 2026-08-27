package = {
    spec = "1",

    name = "dsh-artifact",
    description = "Inline ECharts rendering plugin for DeepSeek Harness",
    repo = "https://github.com/sumarilkkxx/dsh-artifact",
    homepage = "https://github.com/sumarilkkxx/dsh-artifact",
    licenses = {"MIT"},
    authors = {"sumarilkkxx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-artifact",

        versions = {
            ["0.2.0"] = { commit = "3faae245d4d938702209f21a5db4682a50547a66" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
