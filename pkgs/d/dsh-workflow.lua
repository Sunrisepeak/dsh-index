package = {
    spec = "1",

    name = "dsh-workflow",
    description = "把Claude Code的UltraCode模式带给DSH，把 DSH 的一次性多 Agent 调度，升级为可生成、可保存、可治理、可观察、可恢复的 Workflow 层",
    repo = "https://github.com/icetomoyo/dsh_workflow",
    homepage = "https://github.com/icetomoyo/dsh_workflow",
    licenses = {"MIT"},
    authors = {"icetomoyo"},

    status = "dev",
    categories = {"dsh-plugin", "workflow"},
    keywords = {"dsh", "agent-orchestration", "dshtopic", "multi-agent", "workflow"},

    dsh = {
        bundle_name = "@dsh-external/workflow",

        versions = {
            ["0.1.2"] = { commit = "44b83c182aa02d1be8a0803e8446cb495f93cd8f" },
        },
        latest = "0.1.2",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
