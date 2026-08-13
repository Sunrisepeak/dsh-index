package = {
    spec = "1",

    name = "dsh-notification",
    description = "Desktop notifications for DeepSeek Harness turn completions, with per-outcome controls and include/exclude key",
    repo = "https://github.com/omdsh-dev/dsh-notification",
    homepage = "https://github.com/omdsh-dev/dsh-notification",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "desktop", "notify"},
    keywords = {"dsh", "notification"},

    dsh = {
        bundle_name = "dsh-notification",

        versions = {
            ["0.1.1"] = { commit = "3e33100f51f25f24cece20bfd3d50cfbde0cbca5" },
        },
        latest = "0.1.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
