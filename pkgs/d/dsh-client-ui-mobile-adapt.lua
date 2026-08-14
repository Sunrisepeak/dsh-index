package = {
    spec = "1",

    name = "dsh-client-ui-mobile-adapt",
    description = "Your DeepSeek Harness web UI, rebuilt for the phone in your hand. Built for developers who code in Termux on Android: single-column layout, sidebar drawer, one-line composer, fullscreen scrollable settings & trajectory details, tap-to-open session stats. Desktop untouched.",
    repo = "https://github.com/Hotsteel2901/dsh-client-ui-mobile-adapt",
    homepage = "https://github.com/Hotsteel2901/dsh-client-ui-mobile-adapt",
    licenses = {"MIT"},
    authors = {"Hotsteel2901"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "webmobile",

        bundle_name = "dsh-client-ui-mobile-adapt",

        versions = {
            ["0.1.0"] = { commit = "0fa5276a36ddc57a9380aa6488145a2567c3433e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
