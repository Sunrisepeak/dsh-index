package = {
    spec = "1",

    name = "dsh-reverse-skill",
    description = "Complete reverse-skill (85 SKILL.md) as a DeepSeek Harness (dsh) Cordis plugin — reverse engineering, authorized pentesting and security research skill pack.",
    repo = "https://github.com/dhicoc/dsh-reverse-skill",
    homepage = "https://github.com/dhicoc/dsh-reverse-skill",
    licenses = {"MIT"},
    authors = {"dhicoc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@reverse-skill/dsh-reverse-skill",

        versions = {
            ["1.0.0"] = { commit = "a46877d2c49c3858bc4b6d60dcbe369b4881462b" },
        },
        latest = "1.0.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
