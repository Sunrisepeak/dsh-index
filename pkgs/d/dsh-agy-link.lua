package = {
    spec = "1",

    name = "dsh-agy-link",
    description = "Google Antigravity (agy CLI) models for DeepSeek Harness — streaming chat, thinking, tool activity, usage, in-GUI Google OAuth login",
    repo = "https://github.com/amlyczz/dsh-agy-link",
    homepage = "https://github.com/amlyczz/dsh-agy-link",
    licenses = {"MIT"},
    authors = {"amlyczz"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agy-link",

        versions = {
            ["0.4.13"] = { commit = "a405b1c85b0e92c98fa26f73711c4a08d567eea4" },
        },
        latest = "0.4.13",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
