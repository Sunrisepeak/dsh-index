package = {
    spec = "1",

    name = "dsh-agency-agents",
    description = "DSH agency agents 基于 DeepSeek Harness 的全行业智能体",
    repo = "https://github.com/MichengAI/dsh-agency-agents",
    homepage = "https://github.com/MichengAI/dsh-agency-agents",
    licenses = {"Apache-2.0"},
    authors = {"MichengAI"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@michengai/dsh-agency-agents",

        versions = {
            ["0.1.20"] = { commit = "d419213ebdce301c39ce170752d26078b075c7ca" },
        },
        latest = "0.1.20",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
