package = {
    spec = "1",

    name = "dsh-plugin-uw",
    description = "Merge multiple directories into one DSH session with configurable write scopes: primary only, all members via common ancestor, or unrestricted.",
    repo = "https://github.com/lcgash/dsh-plugin-uw",
    homepage = "https://github.com/lcgash/dsh-plugin-uw",
    authors = {"lcgash"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-union-workspace",

        versions = {
            ["0.5.0"] = { commit = "b2873ffa178f4e28de29ff74d673641d957f892e" },
        },
        latest = "0.5.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
