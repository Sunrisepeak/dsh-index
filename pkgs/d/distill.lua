package = {
    spec = "1",

    name = "distill",
    description = "自动对话蒸馏：后台 subagent 反省 + 技能 create/update",
    repo = "https://github.com/LoserFox/distill",
    homepage = "https://github.com/LoserFox/distill",
    authors = {"LoserFox"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "skills"},
    keywords = {"dsh", "distill"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@loserfox/distill",

        versions = {
            ["0.1.0"] = { commit = "d2aaa395adeffe88e429be796c12d829752cbad1" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
