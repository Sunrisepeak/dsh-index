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
            ["0.7.15"] = { commit = "fb52258b6e0cbda4189e4a0464295be51abb48b5" },
            ["0.7.11"] = { commit = "e8c4ddb81b9ee9da9e302416a4054df4b11e0925" },
            ["0.7.10"] = { commit = "03282b81f7aa3581fa8d68dcbe70a7baf71588d9" },
            ["0.5.0"] = { commit = "f1f82e842b2955c816264715fc49fa2a2879bbbd" },
            ["0.4.0"] = { commit = "43bd71a5db0e2237329b53548c8a347a36b10605" },
            ["0.3.0"] = { commit = "8285189b172a723cea1d68e26b14e8ce56d10df1" },
            ["0.2.14"] = { commit = "ef7cc61a7aed38509b7e284cf2b74c71bb681550" },
            ["0.2.6"] = { commit = "22e4dc64578df60590a096c358d7d4beb8059951" },
            ["0.1.22"] = { commit = "98cb98323d75b815307f26eb6e730215fc87952e" },
            ["0.1.21"] = { commit = "e4c1d35402e22bb1576ad724f9749250d3b8c9fa" },
            ["0.1.13"] = { commit = "a996986a1bda8ae4741a533dfd82686911693ace" },
            ["0.1.11"] = { commit = "8127d69c2b657dc4fd20f4628b8775d8933d633e" },
            ["0.1.10"] = { commit = "63c7db1c6f2b3680c1883e8734db7085ce19b9f9" },
            ["0.1.6"] = { commit = "c7161a964322e61057772afbf3cf5224270eabb4" },
            ["0.1.5"] = { commit = "e05d2d095471b49ec45612869eb0c9cfafa429ec" },
            ["0.1.2"] = { commit = "b29b83d5c5df673857f81d5668b7cd1a2a1ad10b" },
            ["0.1.1"] = { commit = "0844db5280cf0b8028fad715fc9e5f1b3b4160f1" },
        },
        latest = "0.7.15",

        needs_build = true,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
