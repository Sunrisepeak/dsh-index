package = {
    spec = "1",

    name = "dsh-windows-mcp",
    description = "Windows desktop automation for DeepSeek Harness: the in-box MCP client bridge mounted against CursorTouch/Windows-MCP, with an off-by-default Computer Use switch and an in-app dependency installer.",
    repo = "https://github.com/helloHub1212/dsh-windows-mcp",
    homepage = "https://github.com/helloHub1212/dsh-windows-mcp",
    licenses = {"MIT"},
    authors = {"helloHub1212"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-windows-mcp",

        versions = {
            ["0.2.3"] = { commit = "30bed20fded4a7dba2a482168fe2477fe771b441" },
        },
        latest = "0.2.3",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
