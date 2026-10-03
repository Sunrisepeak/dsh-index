package = {
    spec = "1",

    name = "dsh-web-file-uploader",
    description = "A file-upload plugin for the DeepSeek Harness web UI.",
    repo = "https://github.com/Mooling0602/dsh-web-file-uploader",
    homepage = "https://github.com/Mooling0602/dsh-web-file-uploader",
    licenses = {"MIT"},
    authors = {"Mooling0602"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-file-uploader",

        versions = {
            ["0.2.1"] = { commit = "dedce39b02826dd007ad1d3fed3658a427c4bb2e" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
