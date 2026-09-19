package = {
    spec = "1",

    name = "dsh-design-skills",
    description = "Design aesthetics skill pack for DeepSeek Harness (DSH) - keeps vibe-coded websites away from the AI look. 6 styles: dark-saas, apple-minimal, neo-neumorphism, brutalism, glassmorphism, japanese-minimal.",
    repo = "https://github.com/zhaiyateng/dsh-design-skills",
    homepage = "https://github.com/zhaiyateng/dsh-design-skills",
    authors = {"zhaiyateng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-design-skills",

        versions = {
            ["0.1.0"] = { commit = "741272753c257c9b48fb60b015b4ecdb438d86e3" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
