package = {
    spec = "1",

    name = "dsh-auto-continue",
    description = "DSH Web UI plugin: auto-sends 「继续」 to resume requests interrupted by network errors or other non-human causes — error classification, adaptive backoff, templated continue text, browser notifications, all configurable from the settings card",
    repo = "https://github.com/HsiangNianian/dsh-auto-continue",
    homepage = "https://github.com/HsiangNianian/dsh-auto-continue",
    licenses = {"MIT"},
    authors = {"HsiangNianian"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-client-auto-continue",

        versions = {
            ["0.8.2"] = { commit = "5076d01e1b6db92fc7f2651c576f9070b8cbb5a2" },
            ["0.8.1"] = { commit = "e865b0b179331769cdce4a1e407a488056c1633d" },
            ["0.7.5"] = { commit = "1d2af1e82651478743e8c6b32e1565c28c7702b3" },
            ["0.7.3"] = { commit = "f53056af85931047b83b105b27fe22bf62d16c5e" },
            ["0.6.2"] = { commit = "89e4eafd2dd55dc89175f102e942f8e71d9ef821" },
            ["0.6.1"] = { commit = "f7fa81b37934eb9f88e238814673a226dfc99b2e" },
            ["0.6.0"] = { commit = "98181b0e5e0afd33ca89b314fc3957a2634602e4" },
            ["0.4.0"] = { commit = "f59db42f9efd1b243f3a33742a334d93b278bd3d" },
            ["0.3.2"] = { commit = "6e041c52575af1c69497ef5be9a8a291adc0279f" },
        },
        latest = "0.8.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
