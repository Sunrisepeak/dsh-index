package = {
    spec = "1",

    name = "dsh-workflow",
    description = "Multi-agent workflow orchestration",
    repo = "https://github.com/icetomoyo/dsh_workflow",
    homepage = "https://github.com/icetomoyo/dsh_workflow",
    licenses = {"MIT"},
    authors = {"icetomoyo"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin", "workflow", "multi-agent"},

    dsh = {
        bundle_name = "@dsh-external/workflow",
        source = "github",
        origin = "icetomoyo/dsh_workflow",

        versions = {
            ["0.1.2"] = { ref = "44b83c182aa02d1be8a0803e8446cb495f93cd8f" },
        },
        latest = "0.1.2",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the mirror
        -- pipeline once a tarball is published to xlings-res; until then
        -- this package installs via architecture A.
    },
}
