package = {
    spec = "1",

    name = "dsh-memento",
    description = "Bounded, layered, approval-gated, auditable cross-session memory for DeepSeek Harness (capability seam: ctx.memory + SQLite provider + memory tool + frozen snapshot injection)",
    repo = "https://github.com/PerryLink/dsh-memento",
    homepage = "https://github.com/PerryLink/dsh-memento",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-memento",

        versions = {
            ["0.4.0"] = { commit = "ad3d7d791e13a1665e453eb8d09b0bf9807f6e63" },
        },
        latest = "0.4.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
