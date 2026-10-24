package = {
    spec = "1",

    name = "dsh-capability-menu",
    description = "Unified capability menu for DeepSeek Harness: manage exposure level (context footprint) and execution mode of MCP tools & skills via Exposed/Progressive/Blocked tiers.",
    repo = "https://github.com/PKUfudawei/dsh-capability-menu",
    homepage = "https://github.com/PKUfudawei/dsh-capability-menu",
    licenses = {"Apache-2.0"},
    authors = {"PKUfudawei"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@daweifu/capability-menu",

        versions = {
            ["0.1.0"] = { commit = "e7a6bffdfa15ff532a9e78ddf026f46511005ed8" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
