package = {
    spec = "1",

    name = "dsh-expert-mode",
    description = "DSH (DeepSeek Harness) 专家模式 agent preset — 首席协调官 + 17位领域专家子代理 Expert-mode preset for DeepSeek Harness",
    repo = "https://github.com/Asher-2000/dsh-expert-mode",
    homepage = "https://github.com/Asher-2000/dsh-expert-mode",
    licenses = {"MIT"},
    authors = {"Asher-2000"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-expert-mode",

        versions = {
            ["0.9.2"] = { commit = "6c2c88e146fc07d22a07ac6e9a6702f746a1d043" },
        },
        latest = "0.9.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
