package = {
    spec = "1",

    name = "dsh-plugin-pi-bridge",
    description = "Bridge pi skills and config into DeepSeek Harness",
    repo = "https://github.com/YYTbit/dsh-plugin-pi-bridge",
    homepage = "https://github.com/YYTbit/dsh-plugin-pi-bridge",
    licenses = {"MIT"},
    authors = {"YYTbit"},

    status = "dev",
    categories = {"dsh-plugin", "skills"},
    keywords = {"dsh", "pi"},

    dsh = {
        bundle_name = "dsh-plugin-pi-bridge",

        versions = {
            ["0.1.0"] = { commit = "1604aaf6bde58b30bfbf32ec83fe548c01ec79d6" },
        },
        latest = "0.1.0",

        needs_build = true,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
