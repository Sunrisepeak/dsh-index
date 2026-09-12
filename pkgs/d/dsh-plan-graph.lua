package = {
    spec = "1",

    name = "dsh-plan-graph",
    description = "another version of deepseek herness trajectory (DIY)",
    repo = "https://github.com/HR2AY/DSH-Plan-Graph",
    homepage = "https://github.com/HR2AY/DSH-Plan-Graph",
    licenses = {"MIT"},
    authors = {"HR2AY"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-plan-graph",

        versions = {
            ["0.3.0"] = { commit = "e7d4919902c5149b26b40246ddc425ae4dbfcdce" },
        },
        latest = "0.3.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
