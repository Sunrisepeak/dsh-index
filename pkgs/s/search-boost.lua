package = {
    spec = "1",

    name = "search-boost",
    description = "Multi-engine web search and evidence synthesis for AI coding agents. Unified MCP server, Pi extension, and DeepSeek Harness bundle — free search, X/Twitter, parallel research, and TUI setup.",
    repo = "https://github.com/Mr-remon219/search-boost",
    homepage = "https://github.com/Mr-remon219/search-boost",
    licenses = {"MIT"},
    authors = {"Mr-remon219"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "search-boost",

        versions = {
            ["0.2.3"] = { commit = "7592723593115fed72992e2a40027bae3474b0cc" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
