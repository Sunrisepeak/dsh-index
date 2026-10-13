package = {
    spec = "1",

    name = "awesome-gaussian-skills",
    description = "图形学与3DGS、空间智能持续更新论文；AI Agent Skills for 3D Gaussian Splatting, NeRF & Computer Graphics Research. 800+ methods, 25categories, 12skills. OpenClaw / Claude Code compatible.",
    repo = "https://github.com/jaccen/Awesome-Gaussian-Skills",
    homepage = "https://github.com/jaccen/Awesome-Gaussian-Skills",
    licenses = {"Apache-2.0"},
    authors = {"jaccen"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "awesome-gaussian-skills",

        versions = {
            ["0.9.8"] = { commit = "d6a1ae5e53898dbf5eab6d9e978ccb77aed1372a" },
        },
        latest = "0.9.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
