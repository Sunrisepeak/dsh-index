package = {
    spec = "1",

    name = "dsh-ui-harmonizer",
    description = "Web UI polish layer for DeepSeek Harness: normalizes unfinished or self-contradictory official UI, reconciles style conflicts between installed plugins, and unifies the visual language via official design tokens.",
    repo = "https://github.com/Physicolor/dsh-ui-harmonizer",
    homepage = "https://github.com/Physicolor/dsh-ui-harmonizer",
    licenses = {"MIT"},
    authors = {"Physicolor"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-ui-harmonizer",

        versions = {
            ["0.8.3"] = { commit = "f5c19217e94a792887a724489a77f66a247629b2" },
        },
        latest = "0.8.3",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
