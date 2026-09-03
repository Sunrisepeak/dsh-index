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
            ["2.0.2"] = { commit = "bfa97a97c05bd7232942ab45ae4a7e58cee768a1" },
            ["2.0.1"] = { commit = "8e772005329de9dc81ffdfd00ae4dbed22a1f73a" },
            ["0.7.0"] = { commit = "55c16e4e4978a5e1cb96203e9ff89b6cf1078b94" },
            ["0.6.3"] = { commit = "564883ec0cf9f896316a604cc4efcbb025fd536a" },
            ["0.3.1"] = { commit = "a1cb4ffeaa09a46fab466b69626808048f554687" },
            ["0.2.6"] = { commit = "81503ac97024f5bd43820dc64b58af1a2eaf54f9" },
        },
        latest = "2.0.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
