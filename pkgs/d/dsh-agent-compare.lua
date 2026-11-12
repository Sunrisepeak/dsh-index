package = {
    spec = "1",

    name = "dsh-agent-compare",
    description = "同一需求，两版真跑，体验后审查采用。Two live builds for one task in DeepSeek Harness.",
    repo = "https://github.com/lijiaqi-AI-Product-Manager/dsh-agent-compare",
    homepage = "https://github.com/lijiaqi-AI-Product-Manager/dsh-agent-compare",
    licenses = {"MIT"},
    authors = {"lijiaqi-AI-Product-Manager"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-agent-compare",

        versions = {
            ["1.0.0"] = { commit = "1efb113f618be754b3350e2a0faed566eaea2abe" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
