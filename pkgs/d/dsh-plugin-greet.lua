package = {
    spec = "1",

    name = "dsh-plugin-greet",
    description = "DeepSeek Harness is a plugin-based system for building AI agents. Everything, from tools and models to the web UI, can be added or replaced as a plugin.",
    repo = "https://github.com/0lidaxiang/dsh-plugin-greet",
    homepage = "https://github.com/0lidaxiang/dsh-plugin-greet",
    licenses = {"MIT"},
    authors = {"0lidaxiang"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-greet",

        versions = {
            ["0.1.0"] = { commit = "23725b2da50489ff67b7843ad5e23cfc542cacf2" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
