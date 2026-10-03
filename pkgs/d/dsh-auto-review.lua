package = {
    spec = "1",

    name = "dsh-auto-review",
    description = "Second-model AI auto-review for DeepSeek Harness approval requests: a read-only reviewer subagent returns structured allow/deny verdicts with reasons, fail-closed by default, fully auditable from the session log (approval/asked -> autoReview/verdict -> approval/decided).",
    repo = "https://github.com/PerryLink/dsh-auto-review",
    homepage = "https://github.com/PerryLink/dsh-auto-review",
    licenses = {"Apache-2.0"},
    authors = {"PerryLink"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-auto-review",

        versions = {
            ["0.5.0"] = { commit = "4dd4a37bb6a790c0200de89f852aae9a5460e433" },
        },
        latest = "0.5.0",

        needs_build = true,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
