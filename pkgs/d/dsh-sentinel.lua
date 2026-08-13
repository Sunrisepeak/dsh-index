package = {
    spec = "1",

    name = "dsh-sentinel",
    description = "Condition-driven wakeup for DeepSeek Harness: durable file/command/http/process/webhook watches that wake the ",
    repo = "https://github.com/fuhefei/dsh-sentinel",
    homepage = "https://github.com/fuhefei/dsh-sentinel",
    licenses = {"BSD-3-Clause"},
    authors = {"fuhefei"},

    status = "dev",
    categories = {"dsh-plugin", "workflow", "notify"},
    keywords = {"dsh", "sentinel"},

    dsh = {
        bundle_name = "@dsh-external/dsh-sentinel",
        source = "github",
        origin = "fuhefei/dsh-sentinel",

        versions = {
            ["0.2.0"] = { ref = "35884673abb10ae3d19f4c0275987502d84bc1f5" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
