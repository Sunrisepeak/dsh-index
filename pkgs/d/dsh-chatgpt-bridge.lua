package = {
    spec = "1",

    name = "dsh-chatgpt-bridge",
    description = "MCP bridge that lets ChatGPT web create, view, continue, and control DeepSeek Harness (DSH) agent sessions.",
    repo = "https://github.com/jiezeng2004-design/dsh-chatgpt-bridge",
    homepage = "https://github.com/jiezeng2004-design/dsh-chatgpt-bridge",
    licenses = {"MIT"},
    authors = {"jiezeng2004-design"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-chatgpt-bridge",

        versions = {
            ["0.4.1"] = { commit = "8c47538e3961a9df5abbd5df55424f8e97f360af" },
        },
        latest = "0.4.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
