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
            ["0.2.2"] = { commit = "b7e2b2a956bf04c012ef31136dbe37a7602a7de5" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
