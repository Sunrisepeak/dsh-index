package = {
    spec = "1",

    name = "echocat-skill-panel",
    description = "DSH 技能调用审计 + 应用内 skill 管理器",
    repo = "https://github.com/VDERR/echocat-skill-panel",
    homepage = "https://github.com/VDERR/echocat-skill-panel",
    licenses = {"MIT"},
    authors = {"VDERR"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "echocat-skill-panel",

        versions = {
            ["4.2.0"] = { commit = "ad0fdacb8dd6ac360eb81033ffbbe57adf7f4cd9" },
        },
        latest = "4.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
