package = {
    spec = "1",

    name = "dsh-taskboard",
    description = "Native local Taskboard plugin for DeepSeek Harness. SQLite-backed projects, Agent claim/review, and a native Web UI — no iframe, no second chat runtime.",
    repo = "https://github.com/shengsheng90/DSH-taskboard",
    homepage = "https://github.com/shengsheng90/DSH-taskboard",
    licenses = {"Apache-2.0"},
    authors = {"shengsheng90"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@shengsheng/dsh-taskboard",

        versions = {
            ["0.1.0"] = { commit = "07f7c730c5d504ed1999e12a7cf8db0c126484e3" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
