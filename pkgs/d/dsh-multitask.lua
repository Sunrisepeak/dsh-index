package = {
    spec = "1",

    name = "dsh-multitask",
    description = "A Multitask \"shock absorber\" plugin & agent preset for DeepSeek Harness (DSH): the main chat only plans, briefs subagents and summarizes results, while file reads, commands, search and builds all run inside subagent contexts. Four worker types, an approval gate, zero DSH source changes.",
    repo = "https://github.com/Senguk520/dsh-multitask",
    homepage = "https://github.com/Senguk520/dsh-multitask",
    licenses = {"MIT"},
    authors = {"Senguk520"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-multitask",

        versions = {
            ["1.2.24"] = { commit = "f4e5eb9b054cf43c6689605a1dadb506de23ff89" },
        },
        latest = "1.2.24",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
