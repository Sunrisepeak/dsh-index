package = {
    spec = "1",

    name = "dsh-web-open",
    description = "DeepSeek Harness (dsh) bundle: when `dsh web` is ready, print the full GUI URL and open it in your default browser. Cross-platform, zero runtime deps, fail-safe.",
    repo = "https://github.com/dawsondx/dsh-web-open",
    homepage = "https://github.com/dawsondx/dsh-web-open",
    licenses = {"MIT"},
    authors = {"dawsondx"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-web-open",

        versions = {
            ["0.1.2"] = { commit = "81d776c5a512777cdcfda4f4162dd32c15b0ae29" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
