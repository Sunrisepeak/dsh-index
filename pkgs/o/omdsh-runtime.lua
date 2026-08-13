package = {
    spec = "1",

    name = "omdsh-runtime",
    description = "dsh plugin from omdsh-dev/omdsh-runtime",
    repo = "https://github.com/omdsh-dev/omdsh-runtime",
    homepage = "https://github.com/omdsh-dev/omdsh-runtime",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "nodejs", "plugin-runtime", "profile-management", "runtime"},

    dsh = {
        bundle_name = "@omdsh/runtime",

        versions = {
            ["0.0.0"] = { commit = "7b63a27edef055a1c35d97d97651e78d41ea8a2f" },
        },
        latest = "0.0.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
