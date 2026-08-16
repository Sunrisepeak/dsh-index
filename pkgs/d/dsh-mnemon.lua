package = {
    spec = "1",

    name = "dsh-mnemon",
    description = "Mnemon 与 DSH 的深度集成插件，为 DSH 提供完备的本地三层记忆体能力：Runtime Memory、可检索 Documents 与受监督 Memory Spaces。",
    repo = "https://github.com/omdsh-dev/dsh-mnemon",
    homepage = "https://github.com/omdsh-dev/dsh-mnemon",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "memory", "provider"},
    keywords = {"dsh", "agent-memory", "ai-agent", "cordis", "external-memory", "knowledge-graph", "llm-agent", "llm-memory", "llm-supervised"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-mnemon",

        versions = {
            ["0.1.4"] = { commit = "ade5a7b395f2d0578ae1d8807b8df7d54ac03c3c" },
            ["0.1.3"] = { commit = "6d958686b9fce1d9f1e783a03dada530ad20174a" },
            ["0.1.0"] = { commit = "f5d0e48af121b3ba3911540380b8fa1f19679b7f" },
        },
        latest = "0.1.4",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
