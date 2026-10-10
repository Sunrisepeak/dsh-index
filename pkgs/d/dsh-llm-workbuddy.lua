package = {
    spec = "1",

    name = "dsh-llm-workbuddy",
    description = "在deepseek harness中使用workbuddy api，因为公司只提供workbuddy积分",
    repo = "https://github.com/Axiaohungry/dsh-llm-workbuddy",
    homepage = "https://github.com/Axiaohungry/dsh-llm-workbuddy",
    licenses = {"MIT"},
    authors = {"Axiaohungry"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@axiaohungry/dsh-llm-workbuddy",

        versions = {
            ["1.3.10"] = { commit = "c180578bce80a275c74494e84756a6ce437296de" },
        },
        latest = "1.3.10",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
