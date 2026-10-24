package = {
    spec = "1",

    name = "dsh-ears",
    description = "A voice-input plugin for DeepSeek Harness that supports multiple ASR backends and polishing through dsh's own LLM route.",
    repo = "https://github.com/WizisCool/dsh-ears",
    homepage = "https://github.com/WizisCool/dsh-ears",
    licenses = {"MIT"},
    authors = {"WizisCool"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ears",

        versions = {
            ["0.1.4"] = { commit = "2dcdd1cd9135ea7189c20ee600768cb2136e478a" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
