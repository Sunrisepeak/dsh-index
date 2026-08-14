package = {
    spec = "1",

    name = "securstack-dsh-plugin",
    description = "SecurStack adapter for DeepSeek Harness: run repository security scans, policy gates, doctor diagnostics, and JSON CLI results from safe AI-agent tools.",
    repo = "https://github.com/securstack/securstack-dsh-plugin",
    homepage = "https://github.com/securstack/securstack-dsh-plugin",
    licenses = {"MIT"},
    authors = {"securstack"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "securstack",

        bundle_name = "@securstack/dsh-plugin",

        versions = {
            ["0.1.0"] = { commit = "1b706dc7fc2dcc4bba6250a9814befa112af86cb" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
