package = {
    spec = "1",

    name = "dsh-browser",
    description = "Shared real browser plugin for DeepSeek Harness",
    repo = "https://github.com/wqty123/dsh-browser",
    homepage = "https://github.com/wqty123/dsh-browser",
    licenses = {"MIT"},
    authors = {"wqty123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-builtin-browser",

        versions = {
            ["0.1.15"] = { commit = "9ffe5d6c0d782f3c489d342943fee56d22d6d283" },
        },
        latest = "0.1.15",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
