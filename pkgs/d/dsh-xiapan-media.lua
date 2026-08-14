package = {
    spec = "1",

    name = "dsh-xiapan-media",
    description = "Native vision, gpt-image-2 and Seedance plugins for DeepSeek Harness via Xiapan Cloud",
    repo = "https://github.com/dongsheng123132/dsh-xiapan-media",
    homepage = "https://github.com/dongsheng123132/dsh-xiapan-media",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-xiapan-media",

        versions = {
            ["0.1.0"] = { commit = "ee2f51f4f50b0b4c8bf85b589c6e52dadd04b689" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
