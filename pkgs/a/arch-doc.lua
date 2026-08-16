package = {
    spec = "1",

    name = "arch-doc",
    description = "Analyze a codebase and generate architecture documentation (module responsibilities, dependencies, entry points, run methods)",
    repo = "https://github.com/duyanta123/arch-doc",
    homepage = "https://github.com/duyanta123/arch-doc",
    licenses = {"MIT"},
    authors = {"duyanta123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "architecture", "documentation", "code-analysis"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "arch-doc",

        versions = {
            ["0.1.0"] = { commit = "76fcfafada67c6eaa25c86769271eae19dcc4132" },
            ["0.1.1"] = { commit = "9ab2ced0955b5232b78cf38814d7e725e91c28fd" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
