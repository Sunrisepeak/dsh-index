package = {
    spec = "1",

    name = "deepseek-harness-acp",
    description = "ACP server implementation for DeepSeek harness. dsh-acp",
    repo = "https://github.com/openma-ai/deepseek-harness-acp",
    homepage = "https://github.com/openma-ai/deepseek-harness-acp",
    authors = {"openma-ai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "acp",

        bundle_name = "@openma/deepseek-harness-acp",

        versions = {
            ["0.4.14"] = { commit = "0cf5797d2a42418417410072edbceb38773c8adc" },
        },
        latest = "0.4.14",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
