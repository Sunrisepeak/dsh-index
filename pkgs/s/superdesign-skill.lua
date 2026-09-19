package = {
    spec = "1",

    name = "superdesign-skill",
    description = "The design skill for Claude Code, Cursor and any coding agent. Stop shipping AI-slop UI: turn it into shippable, tasteful frontend. Install: npx skills add superdesigndev/superdesign-skill. Powered by superdesign.dev",
    repo = "https://github.com/superdesigndev/superdesign-skill",
    homepage = "https://github.com/superdesigndev/superdesign-skill",
    licenses = {"MIT"},
    authors = {"superdesigndev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "superdesign-dsh",

        versions = {
            ["0.4.3"] = { commit = "dc60b43625426bdd1e88fe494739fd5ea27daedd" },
        },
        latest = "0.4.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
