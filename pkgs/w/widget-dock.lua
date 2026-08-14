package = {
    spec = "1",

    name = "widget-dock",
    description = "DSH plugin: draggable widget panel (balance, tokens, stats, commands, goal, cost) for DeepSeek Harness",
    repo = "https://github.com/MorGogh/widget-dock",
    homepage = "https://github.com/MorGogh/widget-dock",
    licenses = {"MIT"},
    authors = {"MorGogh"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "widget-dock",

        versions = {
            ["1.0.1"] = { commit = "25deff7254bd686ac22557c7dfcfbe09995580a8" },
        },
        latest = "1.0.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
