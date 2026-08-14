package = {
    spec = "1",

    name = "dsh-ops-kit",
    description = "A reusable DeepSeek Harness bundle for evidence-driven memory, orchestration, benchmark operations, and plugin release workflows.",
    repo = "https://github.com/LeslieWylie/dsh-ops-kit",
    homepage = "https://github.com/LeslieWylie/dsh-ops-kit",
    licenses = {"MIT"},
    authors = {"LeslieWylie"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-community/dsh-ops-kit",

        versions = {
            ["0.1.0"] = { commit = "c4ba8353cb5825c4ca971836a260ec8f9af7be83" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
