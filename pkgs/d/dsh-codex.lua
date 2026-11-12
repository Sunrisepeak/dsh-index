package = {
    spec = "1",

    name = "dsh-codex",
    description = "Use your ChatGPT subscription in DeepSeek Harness through OpenAI's Codex sign-in flow",
    repo = "https://github.com/Yan-Zero/dsh-codex",
    homepage = "https://github.com/Yan-Zero/dsh-codex",
    licenses = {"Apache-2.0"},
    authors = {"Yan-Zero"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-codex",

        versions = {
            ["0.2.3"] = { commit = "c35d7a41d16cdf6d202cdb1db4108b32cbafaa0e" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
