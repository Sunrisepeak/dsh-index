package = {
    spec = "1",

    name = "perfect-web-clone",
    description = "Pixel-perfect clones of any webpage. Paste a URL, get a measured Vite + React replica.",
    repo = "https://github.com/ericshang98/Perfect-Web-Clone",
    homepage = "https://github.com/ericshang98/Perfect-Web-Clone",
    licenses = {"MIT"},
    authors = {"ericshang98"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "perfect-web-clone",

        versions = {
            ["3.0.0"] = { commit = "c846c37937a70497d37d082c26c85aa1289a9fa5" },
        },
        latest = "3.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
