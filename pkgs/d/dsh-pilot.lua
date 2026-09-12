package = {
    spec = "1",

    name = "dsh-pilot",
    description = "Give your DSH agent hands: drive a real browser (Edge/Chrome over CDP) from the chat — ref-driven clicking, per-session browsers, and a live cockpit panel. Zero runtime deps, no API key.",
    repo = "https://github.com/guo6x/dsh-pilot",
    homepage = "https://github.com/guo6x/dsh-pilot",
    licenses = {"MIT"},
    authors = {"guo6x"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-pilot",

        versions = {
            ["0.4.1"] = { commit = "9103a2d6ef209bd48426a22b057023a90a94d053" },
        },
        latest = "0.4.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
