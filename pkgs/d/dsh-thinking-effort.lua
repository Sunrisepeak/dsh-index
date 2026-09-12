package = {
    spec = "1",

    name = "dsh-thinking-effort",
    description = "Configurable reasoning levels for hand-declared DSH llm-pi-ai models, with bilingual settings and subagent defaults.",
    repo = "https://github.com/hytime/dsh-thinking-effort",
    homepage = "https://github.com/hytime/dsh-thinking-effort",
    licenses = {"MIT"},
    authors = {"hytime"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@hytime/dsh-thinking-effort",

        versions = {
            ["0.1.7"] = { commit = "d15ce42caa51457481a7a3ce2ec603aced78523a" },
        },
        latest = "0.1.7",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
