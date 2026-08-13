package = {
    spec = "1",

    name = "dsh-data-agent",
    description = "让AI帮你连数据库、写SQL的DSH插件",
    repo = "https://github.com/omdsh-dev/dsh-data-agent",
    homepage = "https://github.com/omdsh-dev/dsh-data-agent",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-data-agent",
        source = "github",
        origin = "omdsh-dev/dsh-data-agent",

        versions = {
            ["0.0.1"] = { ref = "55b55bc2a8ba52185cb9a9730de4e60a1d3a5386" },
        },
        latest = "0.0.1",

        needs_build = true,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
