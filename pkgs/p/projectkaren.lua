package = {
    spec = "1",

    name = "projectkaren",
    description = "A DeepSeek Harness plugin that gives a roleplay character a clock: sleep/wake, greetings, idle actions, proactive small talk, and outing photos.",
    repo = "https://github.com/2huy4n/ProjectKaren",
    homepage = "https://github.com/2huy4n/ProjectKaren",
    licenses = {"AGPL-3.0"},
    authors = {"2huy4n"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "project-karen",

        versions = {
            ["0.2.4"] = { commit = "f9961151c32b0a5fd79b76b25660208a43f854cb" },
        },
        latest = "0.2.4",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
