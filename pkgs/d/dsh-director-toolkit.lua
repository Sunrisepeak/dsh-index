package = {
    spec = "1",

    name = "dsh-director-toolkit",
    description = "DSH Director Toolkit is a DeepSeek Harness plugin for 3D artists, technical designers, and creative coders. Paste a half-formed idea, a reference note, or a portfolio caption and get a compact direction pack for Blender, Three.js, Houdini, or C4D.",
    repo = "https://github.com/lhmd/dsh-director-toolkit",
    homepage = "https://github.com/lhmd/dsh-director-toolkit",
    licenses = {"MIT"},
    authors = {"lhmd"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@lhmd/dsh-director-toolkit",

        versions = {
            ["0.1.0"] = { commit = "806b7d9b26cecc6524bc6abcc283b0adb5cde7e6" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
