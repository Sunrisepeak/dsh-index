package = {
    spec = "1",

    name = "mobilevc",
    description = "Turn your phone into the control center for an AI coding assistant CLI session (Claude or Codex) running on your computer.",
    repo = "https://github.com/JayCRL/MobileVC",
    homepage = "https://github.com/JayCRL/MobileVC",
    licenses = {"MIT"},
    authors = {"JayCRL"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "mobilevc-dsh",

        versions = {
            ["0.1.0"] = { commit = "c6efa063b414e8e14030701ffbbbf39c1d62e750" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
