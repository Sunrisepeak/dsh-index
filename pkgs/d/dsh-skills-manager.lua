package = {
    spec = "1",

    name = "dsh-skills-manager",
    description = "DSH Skills Manager 基于 DeepSeek Harness 的Skills管理插件",
    repo = "https://github.com/MichengAI/dsh-skills-manager",
    homepage = "https://github.com/MichengAI/dsh-skills-manager",
    licenses = {"Apache-2.0"},
    authors = {"MichengAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@michengai/dsh-skills-manager",

        versions = {
            ["0.1.23"] = { commit = "2545c8695da1dbff51e9638bc5d79462c533c577" },
        },
        latest = "0.1.23",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
