package = {
    spec = "1",

    name = "dsh-skill-manager",
    description = "Deepseek Harness 的Skill管理插件",
    repo = "https://github.com/Lanxing6480/dsh-skill-manager",
    homepage = "https://github.com/Lanxing6480/dsh-skill-manager",
    licenses = {"MIT"},
    authors = {"Lanxing6480"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@lanxing/dsh-skill-manager",

        versions = {
            ["0.2.0"] = { commit = "2b95fa0cc6cd43663618d4c5be672e4fe8357194" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
