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
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "@dsh-external/dsh-sentinel",

        versions = {
            ["0.11.0"] = { commit = "0a63241ba0370f516fc951e9d32cc94e874190b0" },
            ["0.10.0"] = { commit = "f73e8aeb4af38a09c0d9e9d3e1077911b73f14ab" },
            ["0.2.1"] = { commit = "35884673abb10ae3d19f4c0275987502d84bc1f5" },
        },
        latest = "0.11.0",

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
