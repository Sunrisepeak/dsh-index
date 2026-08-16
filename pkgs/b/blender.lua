package = {
    spec = "1",

    name = "blender",
    description = "DeepSeek Harness plugin for complete Blender 3D modeling, reconstruction, rendering, validation, and export workflows",
    repo = "https://github.com/CheshireJCat/blender",
    homepage = "https://github.com/CheshireJCat/blender",
    licenses = {"MIT"},
    authors = {"CheshireJCat"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-blender",

        versions = {
            ["0.2.1"] = { commit = "3d641dae1c84248f213095f322f6beace0631409" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
