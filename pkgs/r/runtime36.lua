package = {
    spec = "1",

    name = "runtime36",
    description = "DSH-KRouter — Agent knowledge OS. Self-evolution. Timer on by default; API key or subscription is the key. First qualifying day auto-provisional; second accepted task → formal. Correction-first. Retrieval is the lock, not the product. Cursor, Codex, Claude Code, DeepSeek Harness.",
    repo = "https://github.com/398894496-arch/runtime36",
    homepage = "https://github.com/398894496-arch/runtime36",
    licenses = {"MIT"},
    authors = {"398894496-arch"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-krouter",

        versions = {
            ["0.4.0"] = { commit = "27ba1153ae1a70b3272bbcb9ad283437ce154296" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
