package = {
    spec = "1",

    name = "minecraft-dev",
    description = "Minecraft development plugin for DeepSeek Harness: skills & tools for Paper/Spigot plugins and Fabric/Forge/NeoForge mods, MC 1.7.10-26.x",
    repo = "https://github.com/sikadi233-hub/minecraft-dev",
    homepage = "https://github.com/sikadi233-hub/minecraft-dev",
    licenses = {"MIT"},
    authors = {"sikadi233-hub"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "minecraft-dev",

        versions = {
            ["0.6.1"] = { commit = "ff5458c52358b2e945018c8b8a140d56f01b1008" },
        },
        latest = "0.6.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
