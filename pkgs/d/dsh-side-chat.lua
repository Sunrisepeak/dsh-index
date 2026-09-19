package = {
    spec = "1",

    name = "dsh-side-chat",
    description = "Codex-style Side Chat for DeepSeek Harness — select text, ask follow-up questions in a focused side conversation, and keep the main chat uninterrupted.",
    repo = "https://github.com/AHGGG/dsh-side-chat",
    homepage = "https://github.com/AHGGG/dsh-side-chat",
    licenses = {"MIT"},
    authors = {"AHGGG"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@ahggg/dsh-side-chat",

        versions = {
            ["0.6.1"] = { commit = "81d62a07c35d6a301eeeaa27b793c868a6572fe6" },
        },
        latest = "0.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
