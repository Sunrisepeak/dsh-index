package = {
    spec = "1",

    name = "dsh-archive-manager",
    description = "DSH Archive Manager 基于 DeepSeek Harness 的归档会话管理插件",
    repo = "https://github.com/MichengAI/dsh-archive-manager",
    homepage = "https://github.com/MichengAI/dsh-archive-manager",
    licenses = {"Apache-2.0"},
    authors = {"MichengAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@michengai/dsh-archive-manager",

        versions = {
            ["0.1.12"] = { commit = "9aebc82a747112be28f712e5d5cc7dfd84b30aed" },
        },
        latest = "0.1.12",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
