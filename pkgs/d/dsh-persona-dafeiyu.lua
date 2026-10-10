package = {
    spec = "1",

    name = "dsh-persona-dafeiyu",
    description = "Persona library plugin for DeepSeek Harness: built-in personas, import your own, switch without restart.",
    repo = "https://github.com/huaizhuanghub/dsh-persona-dafeiyu",
    homepage = "https://github.com/huaizhuanghub/dsh-persona-dafeiyu",
    licenses = {"MIT"},
    authors = {"huaizhuanghub"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-persona-dafeiyu",

        versions = {
            ["0.3.0"] = { commit = "343772eba93f4ea9beda1b4219bed65319a410e1" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
