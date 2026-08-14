package = {
    spec = "1",

    name = "dsh-focus-chat",
    description = "提供新的「聚焦会话」精简会话视图，更轻松易于阅读，只关注最终产出结果。",
    repo = "https://github.com/dingyi222666/dsh-focus-chat",
    homepage = "https://github.com/dingyi222666/dsh-focus-chat",
    authors = {"dingyi222666"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui", "session"},
    keywords = {"dsh", "focus", "chat"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dingyi222666/dsh-focus-chat",

        versions = {
            ["0.1.1"] = { commit = "0844db5280cf0b8028fad715fc9e5f1b3b4160f1" },
        },
        latest = "0.1.1",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
