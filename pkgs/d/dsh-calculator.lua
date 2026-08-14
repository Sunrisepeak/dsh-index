package = {
    spec = "1",

    name = "dsh-calculator",
    description = "Calculate the real-time cost of DeepSeek API calls made by DeepSeek Harness.",
    repo = "https://github.com/bobcat848/dsh-calculator",
    homepage = "https://github.com/bobcat848/dsh-calculator",
    licenses = {"MIT"},
    authors = {"bobcat848"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-calculator",

        versions = {
            ["1.2.1"] = { commit = "1f4b17db702a6742490ec9410daba86910a59a7a" },
        },
        latest = "1.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
