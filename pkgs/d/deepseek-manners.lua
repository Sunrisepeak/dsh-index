package = {
    spec = "1",

    name = "deepseek-manners",
    description = "DSH 插件：给每次消息后注入感谢语（deepseek-manners）",
    repo = "https://github.com/Moeblack/deepseek-manners",
    homepage = "https://github.com/Moeblack/deepseek-manners",
    authors = {"Moeblack"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "deepseek-manners",
        source = "github",
        origin = "Moeblack/deepseek-manners",

        versions = {
            ["0.1.0"] = { ref = "32f58a8a008797a624f0f46367cb91fed9de5dee" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "NONE",

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
