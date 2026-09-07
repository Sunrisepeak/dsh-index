package = {
    spec = "1",

    name = "dsh-antibrow",
    description = "DeepSeek Harness plugin: give your agent a browser with a persistent identity - engine-level fingerprint spoofing, unlimited free local profiles, Android device emulation, passkeys that survive, and residential proxy egress.",
    repo = "https://github.com/antibrow/dsh-antibrow",
    homepage = "https://github.com/antibrow/dsh-antibrow",
    licenses = {"MIT"},
    authors = {"antibrow"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-antibrow",

        versions = {
            ["0.1.0"] = { commit = "78609a165a2b8dbdec3842917feb929b46f97c6f" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
