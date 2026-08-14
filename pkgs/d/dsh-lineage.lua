package = {
    spec = "1",

    name = "dsh-lineage",
    description = "Content-addressed artifact, fact, action and report lineage for DeepSeek Harness",
    repo = "https://github.com/dongsheng123132/dsh-lineage",
    homepage = "https://github.com/dongsheng123132/dsh-lineage",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "lineage",

        bundle_name = "dsh-lineage",

        versions = {
            ["0.1.0"] = { commit = "7acc5557fbf9c2d5563ea9edbd9bd9ff2637ef01" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
