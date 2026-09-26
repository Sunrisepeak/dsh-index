package = {
    spec = "1",

    name = "dsh-coding-subscription-oauth",
    description = "DeepSeek Harness coding-subscription OAuth: SuperGrok / Grok Build, ChatGPT Plus Codex, Kimi Code, Claude Code. No API-key pasting.",
    repo = "https://github.com/lninghaha/dsh-coding-subscription-oauth",
    homepage = "https://github.com/lninghaha/dsh-coding-subscription-oauth",
    authors = {"lninghaha"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-coding-subscription-oauth",

        versions = {
            ["0.6.1"] = { commit = "f611d6df543ae1908c8e1ed396c00e748e379d43" },
        },
        latest = "0.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
