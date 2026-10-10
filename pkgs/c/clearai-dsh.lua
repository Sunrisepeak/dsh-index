package = {
    spec = "1",

    name = "clearai-dsh",
    description = "ClearAI is a native DSH plugin that brings the Epistemic Loop to DeepSeek Harness.",
    repo = "https://github.com/Clearailhc/clearai-dsh",
    homepage = "https://github.com/Clearailhc/clearai-dsh",
    licenses = {"Apache-2.0"},
    authors = {"Clearailhc"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "clearai-dsh",

        versions = {
            ["0.2.0"] = { commit = "ff8995f93118a021e76d2c7be71215f083072a71" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
