package = {
    spec = "1",

    name = "dsh-passwords",
    description = "Server-grade gateway that turns DeepSeek Harness into a multi-tenant platform: remote access + auto HTTPS, subuser permissions & quotas, sandbox enforcement, encrypted auth, audit log.",
    repo = "https://github.com/slywalker2006/dsh-passwords",
    homepage = "https://github.com/slywalker2006/dsh-passwords",
    licenses = {"BSD-3-Clause"},
    authors = {"slywalker2006"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-passwords",

        versions = {
            ["2.4.8"] = { commit = "c8c8a394e87c0100425ba0018ff05d92d0d4eea2" },
        },
        latest = "2.4.8",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
