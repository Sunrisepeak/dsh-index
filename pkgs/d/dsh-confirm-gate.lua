package = {
    spec = "1",

    name = "dsh-confirm-gate",
    description = "DeepSeek Harness gate - per-turn persistent-operation counter: remind, instruct the model to stop, then ask for confirmation. Steps aside under sandbox/read-only modes; follows a live permission switch without restart. Verified on real hardware (full -> workspace-write -> read-only -> full). Crafted on an estimated 0.27 USD of model spend.",
    repo = "https://github.com/SteelUnion/dsh-confirm-gate",
    homepage = "https://github.com/SteelUnion/dsh-confirm-gate",
    licenses = {"MIT"},
    authors = {"SteelUnion"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-confirm-gate",

        versions = {
            ["0.2.1"] = { commit = "941321f78128f2920dc82ace34d5248c114bbce7" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
