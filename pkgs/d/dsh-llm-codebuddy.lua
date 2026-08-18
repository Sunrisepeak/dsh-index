package = {
    spec = "1",

    name = "dsh-llm-codebuddy",
    description = "在deepseek harness中使用workbuddy api，因为公司只提供workbuddy积分",
    repo = "https://github.com/Axiaohungry/dsh-llm-codebuddy",
    homepage = "https://github.com/Axiaohungry/dsh-llm-codebuddy",
    licenses = {"MIT"},
    authors = {"Axiaohungry"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-llm-codebuddy",

        versions = {
            ["1.3.4"] = { commit = "89da084ac1a13451bb12a22a5306a648ceac6ffb" },
        },
        latest = "1.3.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
