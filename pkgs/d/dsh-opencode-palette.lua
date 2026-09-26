package = {
    spec = "1",

    name = "dsh-opencode-palette",
    description = "🎨 看腻了 DSH 默认皮肤？34 款 opencode 经典配色一键换上——tokyonight、dracula、gruvbox、matrix、rose-pine……即点即换，重启不丢。34 opencode themes for DeepSeek Harness, one click, persisted. More by @FeatherHunter: ⚡ dsh-prompt · 🧠 dsh-mattpocock-skills-deck",
    repo = "https://github.com/FeatherHunter/dsh-opencode-palette",
    homepage = "https://github.com/FeatherHunter/dsh-opencode-palette",
    licenses = {"MIT"},
    authors = {"FeatherHunter"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-opencode-palette",

        versions = {
            ["1.6.4"] = { commit = "11a3c01ff4e6cd22239e990fb8964d8421b04b01" },
        },
        latest = "1.6.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
