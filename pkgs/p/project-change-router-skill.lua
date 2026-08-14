package = {
    spec = "1",

    name = "project-change-router-skill",
    description = "Project-level change routing and reuse governance for AI coding agents. Helps Codex and Claude Code find the right capability boundary, avoid duplicate implementations, respect write constraints, and calibrate routing decisions for large full-stack repositories.",
    repo = "https://github.com/WeirdSky924/project-change-router-skill",
    homepage = "https://github.com/WeirdSky924/project-change-router-skill",
    licenses = {"MIT"},
    authors = {"WeirdSky924"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "project-change-router-skill",

        versions = {
            ["0.3.0"] = { commit = "0ff78c6c6f1f96bd7e3bc67bbf6ac15504d2acce" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
