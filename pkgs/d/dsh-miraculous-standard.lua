package = {
    spec = "1",

    name = "dsh-miraculous-standard",
    description = "DeepSeek V4 Pro/Flash unified anchored agent preset for DeepSeek Harness (official API & opencode-go): two-stage RL-aligned bootstrap, model-aware path routing, epoch-aware long-session stability",
    repo = "https://github.com/rinDBeans/dsh-miraculous-standard",
    homepage = "https://github.com/rinDBeans/dsh-miraculous-standard",
    licenses = {"MIT"},
    authors = {"rinDBeans"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-miraculous-standard",

        versions = {
            ["2.0.0"] = { commit = "9b54d1768143709f0718db944e2b01d010874581" },
        },
        latest = "2.0.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
