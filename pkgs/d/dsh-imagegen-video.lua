package = {
    spec = "1",

    name = "dsh-imagegen-video",
    description = "DeepSeek Harness plugin: image + video generation studio with an infinite canvas. Fork of dickpy/dsh-imagegen with a complete video pipeline and clip stitching.",
    repo = "https://github.com/q253595422/dsh-imagegen-video",
    homepage = "https://github.com/q253595422/dsh-imagegen-video",
    licenses = {"Apache-2.0"},
    authors = {"q253595422"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@q253595422/dsh-imagegen-video",

        versions = {
            ["1.7.6"] = { commit = "bff362b629875eda89beadbc710862bceaa1615b" },
        },
        latest = "1.7.6",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
