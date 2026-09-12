package = {
    spec = "1",

    name = "dsh-evolve-modes",
    description = "让 Agent 的工作方式可组合、可审查、可持续改进，最终实现 Agent Self Evoling。 DeepSeek Harness Web plugin with composable task controls and isolated, human-reviewed self-evolution.",
    repo = "https://github.com/GraySilver/dsh-evolve-modes",
    homepage = "https://github.com/GraySilver/dsh-evolve-modes",
    licenses = {"MIT"},
    authors = {"GraySilver"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@graysilver/dsh-evolve-modes",

        versions = {
            ["0.3.1"] = { commit = "d1f717c8e7e6deae21e6f8e22c728c8572999cc9" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
