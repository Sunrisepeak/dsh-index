package = {
    spec = "1",

    name = "dsh-flash-presets",
    description = "降低Deepseek v4.1flash的Token消耗/Raising Token efficiency with same performance(Works for v4.1flash)",
    repo = "https://github.com/LarryE135/dsh-flash-presets",
    homepage = "https://github.com/LarryE135/dsh-flash-presets",
    licenses = {"MIT"},
    authors = {"LarryE135"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-flash-presets",

        versions = {
            ["0.2.2"] = { commit = "ae289ba3d18b764a778a834325d9a4c1f8de3806" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
