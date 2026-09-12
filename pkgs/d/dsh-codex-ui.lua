package = {
    spec = "1",

    name = "dsh-codex-ui",
    description = "DSH Codex UI 基于 DeepSeek Harness 的 Codex UI 插件，还原度90%，小细节拉满",
    repo = "https://github.com/MichengAI/dsh-codex-ui",
    homepage = "https://github.com/MichengAI/dsh-codex-ui",
    licenses = {"Apache-2.0"},
    authors = {"MichengAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@michengai/dsh-codex-ui",

        versions = {
            ["0.2.61"] = { commit = "020dec3b9ee5c11fb4899f9736bfc3dd69f7920c" },
        },
        latest = "0.2.61",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
