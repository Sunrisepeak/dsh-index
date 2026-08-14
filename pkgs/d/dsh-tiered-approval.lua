package = {
    spec = "1",

    name = "dsh-tiered-approval",
    description = "Tiered auto-review for DeepSeek Harness: static-rule safety net + LLM reviewer + human fallback — auto-allow safe actions, deny irreversible ones, ask a human for the rest.",
    repo = "https://github.com/Elaina-real/dsh-tiered-approval",
    homepage = "https://github.com/Elaina-real/dsh-tiered-approval",
    licenses = {"MIT"},
    authors = {"Elaina-real"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-tiered-approval",

        versions = {
            ["0.1.0"] = { commit = "096e3441a0709de1db7a4f72fdef16768ec51df5" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
