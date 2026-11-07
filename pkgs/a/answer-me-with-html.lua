package = {
    spec = "1",

    name = "answer-me-with-html",
    description = "Answer me with HTML — an agent skill that answers hard questions with a one-page HTML you can actually read. 让 AI Agent 用一页 HTML 回答复杂问题。",
    repo = "https://github.com/QingYunA/answer-me-with-html",
    homepage = "https://github.com/QingYunA/answer-me-with-html",
    licenses = {"MIT"},
    authors = {"QingYunA"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "answer-me-with-html",

        versions = {
            ["0.5.2"] = { commit = "4da5ae89ac435683110aa1b8707d9d4170184c55" },
        },
        latest = "0.5.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
