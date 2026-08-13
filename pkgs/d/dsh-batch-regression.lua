package = {
    spec = "1",

    name = "dsh-batch-regression",
    description = "DSH plugin: run a command N rounds, judge by median/distribution — 批量回归取统计结论",
    repo = "https://github.com/PangYiMing/dsh-batch-regression",
    homepage = "https://github.com/PangYiMing/dsh-batch-regression",
    licenses = {"MIT"},
    authors = {"PangYiMing"},

    status = "dev",
    categories = {"dsh-plugin", "session"},
    keywords = {"dsh", "benchmarking", "regression-testing", "statistics"},

    dsh = {
        bundle_name = "dsh-batch-regression",
        source = "github",
        origin = "PangYiMing/dsh-batch-regression",

        versions = {
            ["0.1.0"] = { ref = "61910a9b656df26ea6eff51cdf047e711a39f9e8" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
