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
            ["0.3.2"] = { commit = "9c0c5a16bf533366dd9ac18713502c68813dd60c" },
            ["0.3.0"] = { commit = "f056c98e4c8ec9a6eeea8206c4c6d111dbb2c355" },
            ["0.2.16"] = { commit = "e5aae00797772bee34f414820b545d21391b84c7" },
            ["0.2.15"] = { commit = "7def5b2bddd4ecb746f09b0c8dee8032e72c690d" },
            ["0.2.14"] = { commit = "97019cb91cdbda78b26b92d89ec59dd2b2138ca8" },
            ["0.2.13"] = { commit = "8cefff7c0521142f5fc2f30aca72c9627ff59265" },
            ["0.2.9"] = { commit = "92f73bf8ef36390224593f764733c1528c4f3114" },
            ["0.2.2"] = { commit = "4e76b79c783e1a85026c29a16d41e4d849f210c3" },
            ["0.1.4"] = { commit = "ade5a7b395f2d0578ae1d8807b8df7d54ac03c3c" },
            ["0.1.3"] = { commit = "6d958686b9fce1d9f1e783a03dada530ad20174a" },
            ["0.1.0"] = { commit = "f5d0e48af121b3ba3911540380b8fa1f19679b7f" },
        },
        latest = "0.3.2",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
