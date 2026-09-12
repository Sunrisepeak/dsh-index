package = {
    spec = "1",

    name = "dsh-font",
    description = "Font switcher for DeepSeek Harness Web GUI: 99 UI fonts + 31 code fonts with CJK-Latin pairing, instant apply, localStorage persistence",
    repo = "https://github.com/tianyhjg-lab/dsh-font",
    homepage = "https://github.com/tianyhjg-lab/dsh-font",
    authors = {"tianyhjg-lab"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-font",

        versions = {
            ["1.1.0"] = { commit = "d299f56bde1e10e7fef152848e74cff2eecd7917" },
        },
        latest = "1.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
