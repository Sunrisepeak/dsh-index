package = {
    spec = "1",

    name = "dsh-btw",
    description = "DSH 一次性只读旁问插件：基于当前上下文回答，独立气泡，不执行工具 · One-shot read-only side-ask plugin: answers from current context in an independent bubble, no tool execution",
    repo = "https://github.com/MichengAI/dsh-btw",
    homepage = "https://github.com/MichengAI/dsh-btw",
    licenses = {"Apache-2.0"},
    authors = {"MichengAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@michengai/dsh-btw",

        versions = {
            ["1.0.3"] = { commit = "eeca8e52c5d753dfbbd14040de21859507ce03c2" },
        },
        latest = "1.0.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
