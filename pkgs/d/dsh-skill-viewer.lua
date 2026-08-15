package = {
    spec = "1",

    name = "dsh-skill-viewer",
    description = "DSH Web UI plugin: Skills settings section with hot enable/disable, delete and add（Web界面的skill管理工具）",
    repo = "https://github.com/Fishquito7/dsh-skill-viewer",
    homepage = "https://github.com/Fishquito7/dsh-skill-viewer",
    licenses = {"MIT"},
    authors = {"Fishquito7"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skill-viewer",

        versions = {
            ["0.2.6"] = { commit = "81503ac97024f5bd43820dc64b58af1a2eaf54f9" },
        },
        latest = "0.2.6",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
