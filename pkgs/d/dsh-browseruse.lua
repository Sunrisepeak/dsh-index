package = {
    spec = "1",

    name = "dsh-browseruse",
    description = "browser-use style browser automation plugin for DeepSeek Harness: drives a dedicated Chrome instance (persistent profile) via playwright-core — fine-grained tools, autonomous tasks, scheduling, dangerous-action confirmation, captcha hand-off",
    repo = "https://github.com/yzd6552-commits/dsh-browseruse",
    homepage = "https://github.com/yzd6552-commits/dsh-browseruse",
    licenses = {"MIT"},
    authors = {"yzd6552-commits"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-browseruse",

        versions = {
            ["1.0.0"] = { commit = "eb52fb00e1fdd3f917f34fb5eef44efe47d8aa75" },
        },
        latest = "1.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
