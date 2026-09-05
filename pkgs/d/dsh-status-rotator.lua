package = {
    spec = "1",

    name = "dsh-status-rotator",
    description = "A DeepSeek Harness (dsh) web plugin that replaces the \"Deep diving…\" turn-status label with phase-aware, typewriter-animated, rainbow-gradient phrases — all configurable from a JSON file.",
    repo = "https://github.com/01Virex/dsh-status-rotator",
    homepage = "https://github.com/01Virex/dsh-status-rotator",
    licenses = {"MIT"},
    authors = {"01Virex"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-status-rotator",

        versions = {
            ["0.2.0"] = { commit = "09836ff04330a17fc670c27a4bed6855547c88ad" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
