package = {
    spec = "1",

    name = "dsh-think-translate",
    description = "Thinking-chain UI translation for DeepSeek Harness: 8 target languages, local Ollama model primary with in-panel download, Google/Bing fallback",
    repo = "https://github.com/UncleK/dsh-think-translate",
    homepage = "https://github.com/UncleK/dsh-think-translate",
    licenses = {"MIT"},
    authors = {"UncleK"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-think-translate",

        versions = {
            ["1.2.5"] = { commit = "46b346b16d03ecbd33aa7836263e608bf89fe383" },
        },
        latest = "1.2.5",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
