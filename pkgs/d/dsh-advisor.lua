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
        bundle_name = "dsh-advisor",

        versions = {
            ["0.1.0"] = { commit = "56aa668ce375e0bbb7a1705fa8133aa94f55a1e2" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
