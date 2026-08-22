package = {
    spec = "1",

    name = "dsh-theme-cyberpunk2077",
    description = "Cyberpunk 2077 / Night City theme for the DeepSeek Harness Web UI — CRT scanlines, Kiroshi lock-on, typewriter SFX, Relic glitch & easter eggs",
    repo = "https://github.com/Tommy00748/dsh-theme-cyberpunk2077",
    homepage = "https://github.com/Tommy00748/dsh-theme-cyberpunk2077",
    authors = {"Tommy00748"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-theme-cyberpunk2077",

        versions = {
            ["0.1.4"] = { commit = "a3681ee431f59c64b8bf37d34ee609ddc7811278" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
