package = {
    spec = "1",

    name = "dsh-daily-progress",
    description = "dsh plugin from omdsh-dev/dsh-daily-progress",
    repo = "https://github.com/omdsh-dev/dsh-daily-progress",
    homepage = "https://github.com/omdsh-dev/dsh-daily-progress",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "daily", "progress"},

    dsh = {
        bundle_name = "dsh-daily-progress",

        versions = {
            ["0.1.0"] = { commit = "c7bcc9dfac36fc8a3393e86eba4df6f74104278e" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
