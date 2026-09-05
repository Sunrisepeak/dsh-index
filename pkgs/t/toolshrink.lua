package = {
    spec = "1",

    name = "toolshrink",
    description = "Cut large agent tool output by what it means, not by where it was cut. 13 content-aware reducers + DeepSeek Harness plugin.",
    repo = "https://github.com/unclecode/toolshrink",
    homepage = "https://github.com/unclecode/toolshrink",
    licenses = {"MIT"},
    authors = {"unclecode"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "toolshrink",

        versions = {
            ["0.1.0"] = { commit = "3d654ab491146dd685f0b47fef94e78a14590860" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
