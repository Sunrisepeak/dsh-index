package = {
    spec = "1",

    name = "dsh-echocat-skill-panel",
    description = "DSH 技能调用审计 + 应用内 skill 管理器",
    repo = "https://github.com/VDERR/dsh-echocat-skill-panel",
    homepage = "https://github.com/VDERR/dsh-echocat-skill-panel",
    licenses = {"MIT"},
    authors = {"VDERR"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-echocat-skill-panel",

        versions = {
            ["5.0.0"] = { commit = "e89e08cd7c2babfeb0b8b1143e9061f93337be4d" },
        },
        latest = "5.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
