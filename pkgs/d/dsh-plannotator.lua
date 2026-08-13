package = {
    spec = "1",

    name = "dsh-plannotator",
    description = "DSH 计划批注插件：选中计划原文、逐条批注，并把结构化反馈送回 Agent。 / A DSH plan-review plugin for anchored annotations and structured Age",
    repo = "https://github.com/titanwings/dsh-plannotator",
    homepage = "https://github.com/titanwings/dsh-plannotator",
    licenses = {"MIT"},
    authors = {"titanwings"},

    status = "dev",
    categories = {"dsh-plugin", "workflow"},
    keywords = {"dsh", "plan-review", "plannotator"},

    dsh = {
        bundle_name = "@dsh-external/dsh-plannotator",
        source = "github",
        origin = "titanwings/dsh-plannotator",

        versions = {
            ["0.1.0"] = { ref = "c0fe880107aa09ef595a8b6fdac6d7099e4b46da" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
