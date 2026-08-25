package = {
    spec = "1",

    name = "nowledge-mem-deepseek-harness",
    description = "Nowledge Mem community plugin bundle for DeepSeek Harness",
    repo = "https://github.com/nowledge-co/nowledge-mem-deepseek-harness",
    homepage = "https://github.com/nowledge-co/nowledge-mem-deepseek-harness",
    authors = {"nowledge-co"},

    status = "dev",
    categories = {"dsh-plugin", "memory", "tools"},
    keywords = {"dsh", "knowledge-graph", "mcp", "memory", "nowledge-mem", "ontology"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "nowledge-mem-deepseek-harness",

        versions = {
            ["0.1.3"] = { commit = "2ef49f101e4f408ee368423c652430ae954b4a22" },
            ["0.1.2"] = { commit = "b75629b10823aca8cf7cc268868c550542ab2580" },
            ["0.1.0"] = { commit = "97956d33e793c5c3f2ac4847fdbb004993b235e6" },
        },
        latest = "0.1.3",

        needs_build = false,

        -- Upstream ships no redistributable license, so this index has
        -- no right to mirror it: no `mirror` block, installs straight
        -- from git, and it cannot be recovered if upstream disappears.
    },
}
