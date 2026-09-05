package = {
    spec = "1",

    name = "dsh-directorx",
    description = "DirectorX as a DeepSeek Harness plugin: AI video/image/audio skills, knowledge corpus, and configurable vision/image/video/audio model tools.",
    repo = "https://github.com/LaplaceYoung/dsh-directorx",
    homepage = "https://github.com/LaplaceYoung/dsh-directorx",
    licenses = {"Apache-2.0"},
    authors = {"LaplaceYoung"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-directorx",

        versions = {
            ["0.2.0"] = { commit = "f2f764cd1b557d73b1e65821db9257bb2ec8c262" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
