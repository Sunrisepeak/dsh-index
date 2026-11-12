package = {
    spec = "1",

    name = "dsh-llm-verifier",
    description = "Configurable DSH-native LLM verifier with a Web settings page",
    repo = "https://github.com/Aa728848/dsh-llm-verifier",
    homepage = "https://github.com/Aa728848/dsh-llm-verifier",
    licenses = {"MIT"},
    authors = {"Aa728848"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-llm-verifier",

        versions = {
            ["0.2.1"] = { commit = "a6e4d1554c53a161d259b5f8c6e13c9037a3c6e4" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
