package = {
    spec = "1",

    name = "dsh-multi-tenant",
    description = "Multi-tenant SaaS extension for DeepSeek Harness (DSH): tenant identity, session isolation, authorization, tenant-aware MCP, and audit.",
    repo = "https://github.com/GuoMonth/dsh-multi-tenant",
    homepage = "https://github.com/GuoMonth/dsh-multi-tenant",
    licenses = {"MIT"},
    authors = {"GuoMonth"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-multi-tenant",

        versions = {
            ["0.1.0"] = { commit = "1940e2eaa58eda108c95772ab1943c85a601f788" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
