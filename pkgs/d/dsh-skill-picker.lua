package = {
    spec = "1",

    name = "dsh-skill-picker",
    description = "DSH 实现 workbuddy 同款选择 skill 功能 | WorkBuddy-style skill picker for DeepSeek Harness: pick a skill in the composer, insert the official /skill-name gesture, and DSH loads it with your message.",
    repo = "https://github.com/a735624258/dsh-skill-picker",
    homepage = "https://github.com/a735624258/dsh-skill-picker",
    licenses = {"MIT"},
    authors = {"a735624258"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-skill-picker",

        versions = {
            ["0.1.0"] = { commit = "53930f810ec3aa828def7ba5801e80094a76cb10" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
