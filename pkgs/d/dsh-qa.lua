package = {
    spec = "1",

    name = "dsh-qa",
    description = "dsh-qa · QA Workbench — A local software testing workbench plugin for DeepSeek Harness. Zero-dependency test project & iteration management with AI-assisted requirements, test cases, defects, milestones, reports, kanban and calendar.",
    repo = "https://github.com/naodeng/dsh-qa",
    homepage = "https://github.com/naodeng/dsh-qa",
    authors = {"naodeng"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-qa",

        versions = {
            ["0.2.0"] = { commit = "06519af93efb3ea70b6b7c018cb7dcf3b1f8f22b" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
