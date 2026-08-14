package = {
    spec = "1",

    name = "deepseek-manners",
    description = "DSH 插件：给每次消息后注入感谢语（deepseek-manners）",
    repo = "https://github.com/Moeblack/deepseek-manners",
    homepage = "https://github.com/Moeblack/deepseek-manners",
    authors = {"Moeblack"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "deepseek", "manners"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "deepseek-manners",

        versions = {
            ["0.1.0"] = { commit = "32f58a8a008797a624f0f46367cb91fed9de5dee" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
