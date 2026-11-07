package = {
    spec = "1",

    name = "dsh-mech-workbench",
    description = "Engineering & math problem workbench for DSH · 工科与数学题解工作台：读题图、求解、出图、自检，9 个工具 + 4 个技能",
    repo = "https://github.com/insideyou-0501/dsh-mech-workbench",
    homepage = "https://github.com/insideyou-0501/dsh-mech-workbench",
    licenses = {"MIT"},
    authors = {"insideyou-0501"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mech-workbench",

        versions = {
            ["0.3.1"] = { commit = "0c0789fd65d34cf895e23f5019c8076d517b0022" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
