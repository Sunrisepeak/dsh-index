package = {
    spec = "1",

    name = "dsh-boot-animation",
    description = "DSH plugin: replaces the kernel boot page with a full-window video clip, then dissolves into the app. 中文说明见 MANUAL.md",
    repo = "https://github.com/lxj5820/dsh-boot-animation",
    homepage = "https://github.com/lxj5820/dsh-boot-animation",
    authors = {"lxj5820"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-boot-animation",

        versions = {
            ["0.3.0"] = { commit = "b7786cd749ef18608340a8f5e2071a3656ebf009" },
        },
        latest = "0.3.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
