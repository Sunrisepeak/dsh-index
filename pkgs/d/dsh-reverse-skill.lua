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

        bundle_name = "@dhicoc/dsh-reverse-skill",

        versions = {
            ["1.0.2"] = { commit = "ff9c693fb5936178c9ed0cbb2b951cd0521a2f72" },
        },
        latest = "1.0.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
