package = {
    spec = "1",

    name = "dsh-plugin-anti-ads",
    description = "dsh plugin from HuanLinOTO/dsh-plugin-anti-ads",
    repo = "https://github.com/HuanLinOTO/dsh-plugin-anti-ads",
    homepage = "https://github.com/HuanLinOTO/dsh-plugin-anti-ads",
    authors = {"HuanLinOTO"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@huanlin/dsh-plugin-anti-ads",
        source = "github",
        origin = "HuanLinOTO/dsh-plugin-anti-ads",

        versions = {
            ["0.2.0"] = { ref = "a72aa231b9aaae1e4ce2331fb7cffad2541356fa" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "NOASSERTION",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
