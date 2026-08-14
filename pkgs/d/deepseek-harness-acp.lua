package = {
    spec = "1",

    name = "deepseek-harness-acp",
    description = "ACP server implementation for DeepSeek harness",
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
            ["0.4.5"] = { commit = "f1f60c3f30544d91d36944a2385c98636e4c0ec2" },
        },
        latest = "0.4.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
