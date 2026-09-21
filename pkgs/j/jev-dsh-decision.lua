package = {
    spec = "1",

    name = "jev-dsh-decision",
    description = "Jev DSH 决策引擎｜面向 Agent Harness 的结构化决策插件。原生支持 DeepSeek Harness，通过 iPolloWork 支持 OpenCode、Codex Harness。",
    repo = "https://github.com/Devin-AXIS/jev-dsh-decision",
    homepage = "https://github.com/Devin-AXIS/jev-dsh-decision",
    authors = {"Devin-AXIS"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-jev-decision-model",

        versions = {
            ["0.1.2"] = { commit = "adc88caa9bf174d367e79a5f254c7936bcef088e" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
