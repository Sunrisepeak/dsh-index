package = {
    spec = "1",

    name = "dsh-telemetry-redactor",
    description = "Fail-closed export-copy redaction for DeepSeek Harness session telemetry",
    repo = "https://github.com/030611/dsh-telemetry-redactor",
    homepage = "https://github.com/030611/dsh-telemetry-redactor",
    licenses = {"MIT"},
    authors = {"030611"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-telemetry-redactor",

        versions = {
            ["0.1.0"] = { commit = "811b0b1abf424e57045ab5a5eaa203660ca43908" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
