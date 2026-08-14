package = {
    spec = "1",

    name = "dsh-acp-plugin",
    description = "Agentic Control Plane for DeepSeek Harness — policy-check every tool call before it runs",
    repo = "https://github.com/agentic-control-plane/dsh-acp-plugin",
    homepage = "https://github.com/agentic-control-plane/dsh-acp-plugin",
    licenses = {"MIT"},
    authors = {"agentic-control-plane"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plugin-acp",

        versions = {
            ["0.1.2"] = { commit = "56b1abee25e328f2c4cd4b00e58571e7e034151f" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
