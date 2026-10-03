package = {
    spec = "1",

    name = "dsh-codex-oauth",
    description = "Use your OpenAI subscription with DeepSeek Harness to access GPT models, image generation, and web search.",
    repo = "https://github.com/WNJXYK/dsh-codex-oauth",
    homepage = "https://github.com/WNJXYK/dsh-codex-oauth",
    licenses = {"MIT"},
    authors = {"WNJXYK"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@wnjxyk/dsh-codex-oauth",

        versions = {
            ["0.4.2"] = { commit = "06bc69cea6e92f86c59c50d41d785303d38bf51d" },
        },
        latest = "0.4.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
