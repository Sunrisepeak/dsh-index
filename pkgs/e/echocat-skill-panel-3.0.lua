package = {
    spec = "1",

    name = "echocat-skill-panel-3.0",
    description = "DSH 技能调用审计 + 应用内 skill 管理器",
    repo = "https://github.com/VDERR/echocat-skill-panel-3.0",
    homepage = "https://github.com/VDERR/echocat-skill-panel-3.0",
    licenses = {"MIT"},
    authors = {"VDERR"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "echocat-skill-panel-3.0",

        versions = {
            ["3.0.0"] = { commit = "5c50a0e65e3bbb09eb99766abf8df9c2a9b7c14c" },
        },
        latest = "3.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
