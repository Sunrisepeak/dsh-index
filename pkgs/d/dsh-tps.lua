package = {
    spec = "1",

    name = "dsh-tps",
    description = "只是一个 tps 插件",
    repo = "https://github.com/Small-tailqwq/dsh-tps",
    homepage = "https://github.com/Small-tailqwq/dsh-tps",
    licenses = {"BSD-3-Clause"},
    authors = {"Small-tailqwq"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/tps",
        source = "github",
        origin = "Small-tailqwq/dsh-tps",

        versions = {
            ["0.1.0"] = { ref = "69dac729c6c8dd3cec37cc182e69d5a08c5685e2" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "BSD-3-Clause",

        -- non-default bundle patch path
        patch = "./cordis.yml",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
