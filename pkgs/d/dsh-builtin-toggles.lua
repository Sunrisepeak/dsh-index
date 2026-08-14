package = {
    spec = "1",

    name = "dsh-builtin-toggles",
    description = "Built-in plugin catalog and safe GUI toggles for DeepSeek Harness Web.",
    repo = "https://github.com/Starfie1d1272/dsh-builtin-toggles",
    homepage = "https://github.com/Starfie1d1272/dsh-builtin-toggles",
    licenses = {"MIT"},
    authors = {"Starfie1d1272"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-builtin-toggles",

        versions = {
            ["0.2.0"] = { commit = "e3ad60796c5d4731fbc008ba958b664f3b330838" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
