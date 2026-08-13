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

        versions = {
            ["0.2.1"] = { commit = "35884673abb10ae3d19f4c0275987502d84bc1f5" },
        },
        latest = "0.2.1",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.2.1"] = {
                tarball = "dsh-sentinel-0.2.1.tgz",
                sha256  = "59a68fdfd9013627568a38e9b0b13fc972dadeea53ba8a25b03e3555154f8351",
                cn      = true,
            },
        },
    },
}
