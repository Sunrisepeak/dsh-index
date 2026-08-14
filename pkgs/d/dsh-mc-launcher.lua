package = {
    spec = "1",

    name = "dsh-mc-launcher",
    description = "Minecraft launcher built on DeepSeek Harness: full-screen launcher UI (root slot) with version download, Microsoft device-code login and game launch from the DSH host process. UNOFFICIAL open-source launcher.",
    repo = "https://github.com/hellosky983/dsh-mc-launcher",
    homepage = "https://github.com/hellosky983/dsh-mc-launcher",
    licenses = {"MIT"},
    authors = {"hellosky983"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "minecraft",

        bundle_name = "dsh-mc-launcher",

        versions = {
            ["0.1.0"] = { commit = "7f4ff72ebc7dd34439f897e8b9fcc43f90a267d0" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
