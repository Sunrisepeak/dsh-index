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
            ["0.1.13"] = { commit = "a996986a1bda8ae4741a533dfd82686911693ace" },
            ["0.1.11"] = { commit = "8127d69c2b657dc4fd20f4628b8775d8933d633e" },
            ["0.1.10"] = { commit = "63c7db1c6f2b3680c1883e8734db7085ce19b9f9" },
            ["0.1.6"] = { commit = "c7161a964322e61057772afbf3cf5224270eabb4" },
            ["0.1.5"] = { commit = "e05d2d095471b49ec45612869eb0c9cfafa429ec" },
            ["0.1.2"] = { commit = "b29b83d5c5df673857f81d5668b7cd1a2a1ad10b" },
            ["0.1.1"] = { commit = "0844db5280cf0b8028fad715fc9e5f1b3b4160f1" },
        },
        latest = "0.1.13",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
