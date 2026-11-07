package = {
    spec = "1",

    name = "dsh-bottom-info-bar",
    description = "DeepSeek Harness (DSH) plugin: replaces the stats row under the composer with provider and model, balance or subscription quota, peak/off-peak pricing, and session spend.",
    repo = "https://github.com/songoao25/dsh-bottom-info-bar",
    homepage = "https://github.com/songoao25/dsh-bottom-info-bar",
    licenses = {"MIT"},
    authors = {"songoao25"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-bottom-info-bar",

        versions = {
            ["1.19.2"] = { commit = "5eff540515145377120c5d1032670fc746a98435" },
        },
        latest = "1.19.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
