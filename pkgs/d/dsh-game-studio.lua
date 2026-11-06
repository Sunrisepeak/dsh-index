package = {
    spec = "1",

    name = "dsh-game-studio",
    description = "Describe a small game in one sentence, play it in the DeepSeek Harness sidebar, swap in AI art, export one HTML file.",
    repo = "https://github.com/ZSeven-W/dsh-game-studio",
    homepage = "https://github.com/ZSeven-W/dsh-game-studio",
    licenses = {"MIT"},
    authors = {"ZSeven-W"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@zseven-w/dsh-game-studio",

        versions = {
            ["0.1.0-rc.3"] = { commit = "4cdd5cc3aa274d7cd2a5d525ef30d406776368d2" },
        },
        latest = "0.1.0-rc.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
