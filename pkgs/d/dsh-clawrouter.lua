package = {
    spec = "1",

    name = "dsh-clawrouter",
    description = "A safety gate for DeepSeek Harness: a stronger model reviews dangerous tool calls before they run. Plus vision and 67 models from one wallet, paid per request over x402.",
    repo = "https://github.com/BlockRunAI/dsh-clawrouter",
    homepage = "https://github.com/BlockRunAI/dsh-clawrouter",
    licenses = {"MIT"},
    authors = {"BlockRunAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-clawrouter",

        versions = {
            ["0.10.1"] = { commit = "18fc2466cdea00d3854323b01756b51eec190029" },
        },
        latest = "0.10.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
