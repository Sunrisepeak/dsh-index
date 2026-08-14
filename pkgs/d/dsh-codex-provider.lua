package = {
    spec = "1",

    name = "dsh-codex-provider",
    description = "OpenAI Codex provider for DeepSeek Harness with device-code OAuth, Codex CLI import, token refresh, and a web settings panel.",
    repo = "https://github.com/Hu9956/dsh-codex-provider",
    homepage = "https://github.com/Hu9956/dsh-codex-provider",
    licenses = {"MIT"},
    authors = {"Hu9956"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-codex-provider",

        versions = {
            ["0.1.0"] = { commit = "15d8c9ecadbf1faba5fe3ed14f920cb74975b20b" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
