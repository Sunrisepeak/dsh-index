package = {
    spec = "1",

    name = "plugin-template",
    description = "基于原turtle ui官方仓库创建的plugin模板仓库",
    repo = "https://github.com/omdsh-dev/plugin-template",
    homepage = "https://github.com/omdsh-dev/plugin-template",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "plugin", "template"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@your-scope/dsh-plugin-template",

        versions = {
            ["0.0.1"] = { commit = "68e1a7dce77471d0850c2c8e4e68d508be885917" },
        },
        latest = "0.0.1",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.0.1"] = {
                tarball = "plugin-template-0.0.1.tgz",
                sha256  = "d5f600f4d9a9106aee885fbaddc465822c16c4ba017cb32fb65ec79efbd3d101",
                cn      = true,
            },
        },
    },
}
