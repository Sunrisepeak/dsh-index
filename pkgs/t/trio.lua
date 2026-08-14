package = {
    spec = "1",

    name = "trio",
    description = "DSH 全家桶:浏览器自动化 + MCP Server + GitHub 集成 | Browser automation + MCP server + GitHub for DeepSeek Harness — one install, three superpowers",
    repo = "https://github.com/huey1in/trio",
    homepage = "https://github.com/huey1in/trio",
    licenses = {"MIT"},
    authors = {"huey1in"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-trio",

        versions = {
            ["0.5.1"] = { commit = "4f2942f8622e1d73225501e2f97d07df5a2953c2" },
        },
        latest = "0.5.1",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
