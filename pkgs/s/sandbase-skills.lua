package = {
    spec = "1",

    name = "sandbase-skills",
    description = "88 installable open-source Agent Skills for research, social intelligence, marketing, and business workflows—compatible with Codex, Claude Code, Cursor, Gemini CLI, and DeepSeek Harness.",
    repo = "https://github.com/sandbaseai/sandbase-skills",
    homepage = "https://github.com/sandbaseai/sandbase-skills",
    licenses = {"Apache-2.0"},
    authors = {"sandbaseai"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@sandbaseai/dsh-skills",

        versions = {
            ["0.3.4"] = { commit = "21156500e662f4d7475a9f56a564101b3225d005" },
        },
        latest = "0.3.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
