package = {
    spec = "1",

    name = "task-passport",
    description = "Open task handoff protocol for DeepSeek Harness, WorkBuddy, Claude Code and Codex — verified state, not chat logs",
    repo = "https://github.com/dongsheng123132/task-passport",
    homepage = "https://github.com/dongsheng123132/task-passport",
    licenses = {"MIT"},
    authors = {"dongsheng123132"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "task-passport",

        versions = {
            ["0.2.2"] = { commit = "19672b5c7c06151d8d0af6760830ee2d27371665" },
        },
        latest = "0.2.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
