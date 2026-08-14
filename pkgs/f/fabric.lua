package = {
    spec = "1",

    name = "fabric",
    description = "一种类似MC Fabric的hook处理器",
    repo = "https://github.com/omdsh-dev/fabric",
    homepage = "https://github.com/omdsh-dev/fabric",
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "fabric"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "cordis-fabric-bundle",

        versions = {
            ["0.0.2"] = { commit = "08358f930cd1122268f801cb7b11160338bac2c9" },
        },
        latest = "0.0.2",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
