package = {
    spec = "1",

    name = "dsh-codex-connect",
    description = "ChatGPT OAuth and Codex models for DeepSeek Harness.",
    repo = "https://github.com/franksong2702/dsh-codex-connect",
    homepage = "https://github.com/franksong2702/dsh-codex-connect",
    licenses = {"Apache-2.0"},
    authors = {"franksong2702"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-codex-connect",

        versions = {
            ["0.1.0-alpha.4.5"] = { commit = "2c99d177db51bfa18683b4e3c13d125ec0200367" },
        },
        latest = "0.1.0-alpha.4.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
