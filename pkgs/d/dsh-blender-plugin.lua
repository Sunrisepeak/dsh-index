package = {
    spec = "1",

    name = "dsh-blender-plugin",
    description = "DSH x Blender direct realtime plugin v1.0 — let an AI model drive Blender over a direct TCP channel: viewport frames, custom-angle renders, inner-loop search, render profiling, safe decimation, headless offload, one-call GUI launch (15 tools + blender_rt_plan: 28 families / 183 ops). 配套 skill：sixtysevenlf/dsh-skill-blender-modeling",
    repo = "https://github.com/sixtysevenlf/dsh-blender-plugin",
    homepage = "https://github.com/sixtysevenlf/dsh-blender-plugin",
    licenses = {"BSD-3-Clause"},
    authors = {"sixtysevenlf"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-blender-plugin",

        versions = {
            ["1.0.4"] = { commit = "84afd4b18f5acee73bd8590688971a17a87a5bbf" },
        },
        latest = "1.0.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
