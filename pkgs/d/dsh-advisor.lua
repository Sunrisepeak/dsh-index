package = {
    spec = "1",

    name = "dsh-advisor",
    description = "Advisor - Pair a second model that passively reviews each turn and injects notes. 搭配一个会在每轮对话被动注入见解和审查的副模型。",
    repo = "https://github.com/btspoony/dsh-advisor",
    homepage = "https://github.com/btspoony/dsh-advisor",
    licenses = {"MIT"},
    authors = {"btspoony"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "session"},
    keywords = {"dsh", "advisor", "agentic-ai"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-advisor",

        versions = {
            ["0.1.0"] = { commit = "56aa668ce375e0bbb7a1705fa8133aa94f55a1e2" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-advisor-0.1.0.tgz",
                sha256  = "e49c4c37805801e72024ff68b6c109480ba822b446a2216ed63f3f959afcb17d",
                cn      = true,
            },
        },
    },
}
