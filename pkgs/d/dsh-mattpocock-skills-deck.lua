package = {
    spec = "1",

    name = "dsh-mattpocock-skills-deck",
    description = "拨开战争迷雾看见终点，剩下的交给 MattSkillsDeck。让 mattpocock/skills 在 DSH 里化作一块看得见、派得动的任务板。 Part the fog of war, see the end — MattSkillsDeck handles the rest. A playable task board for mattpocock/skills in DeepSeek Harness.",
    repo = "https://github.com/FeatherHunter/dsh-mattpocock-skills-deck",
    homepage = "https://github.com/FeatherHunter/dsh-mattpocock-skills-deck",
    licenses = {"MIT"},
    authors = {"FeatherHunter"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mattpocock-skills-deck",

        versions = {
            ["1.7.7"] = { commit = "e86a26c35dbdf4e3df74287959ddee207fd2880a" },
        },
        latest = "1.7.7",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
