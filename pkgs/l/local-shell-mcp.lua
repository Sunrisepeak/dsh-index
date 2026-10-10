package = {
    spec = "1",

    name = "local-shell-mcp",
    description = "Enables LLM to use a cli environment.",
    repo = "https://github.com/fwerkor/local-shell-mcp",
    homepage = "https://github.com/fwerkor/local-shell-mcp",
    licenses = {"MIT"},
    authors = {"fwerkor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "tunnel",

        bundle_name = "local-shell-mcp-dsh",

        versions = {
            ["4.0.0"] = { commit = "67a31be3543b447157583c85c2b786910684a2b9" },
        },
        latest = "4.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
