package = {
    spec = "1",

    name = "dsh-with-chatgpt",
    description = "Bring ChatGPT’s reasoning to your local codebase. Work directly, or delegate larger tasks to DSH.",
    repo = "https://github.com/BeforeWave/dsh-with-chatgpt",
    homepage = "https://github.com/BeforeWave/dsh-with-chatgpt",
    licenses = {"MIT"},
    authors = {"BeforeWave"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@beforewave/dsh-with-chatgpt",

        versions = {
            ["0.1.3"] = { commit = "a285112db5626061f9fc4ba8fed04bd164149c67" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
