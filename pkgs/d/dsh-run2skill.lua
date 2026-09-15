package = {
    spec = "1",

    name = "dsh-run2skill",
    description = "Automatically turn successful DeepSeek Harness sessions into reusable, reviewable Agent Skills.",
    repo = "https://github.com/qkycir-123/dsh-run2skill",
    homepage = "https://github.com/qkycir-123/dsh-run2skill",
    licenses = {"MIT"},
    authors = {"qkycir-123"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-run2skill",

        versions = {
            ["0.3.1"] = { commit = "866f4f68657c0784a9c72576d2efceecd4c87781" },
        },
        latest = "0.3.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
