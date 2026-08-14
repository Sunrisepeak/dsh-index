package = {
    spec = "1",

    name = "dsh-atomgit",
    description = "AtomGit plugin bundle for DeepSeek Harness (dsh): atomgit-skills workflows + ag CLI + platform-hosted GitCode MCP tools",
    repo = "https://github.com/xiongjiamu/dsh-atomgit",
    homepage = "https://github.com/xiongjiamu/dsh-atomgit",
    authors = {"xiongjiamu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-atomgit",

        versions = {
            ["0.1.0"] = { commit = "2ae91bf975d8f13389e78fcdd26d1654e1613f5a" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
