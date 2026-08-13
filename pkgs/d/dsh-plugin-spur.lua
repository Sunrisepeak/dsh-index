package = {
    spec = "1",

    name = "dsh-plugin-spur",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-spur",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-spur",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-spur",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "plugin", "spur"},

    dsh = {
        bundle_name = "@huanlin/dsh-plugin-spur",
        source = "github",
        origin = "HuanLinOTO/dsh-plugin-spur",

        versions = {
            ["0.1.0"] = { ref = "0411e76690a19976bdb8f0423654d9c6b27b4a57" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NOASSERTION",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
