package = {
    spec = "1",

    name = "omdsh-runtime",
    description = "dsh plugin from omdsh-dev/omdsh-runtime",
    repo = "https://github.com/omdsh-dev/omdsh-runtime",
    homepage = "https://github.com/omdsh-dev/omdsh-runtime",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@omdsh/runtime",
        source = "github",
        origin = "omdsh-dev/omdsh-runtime",

        versions = {
            ["0.0.0"] = { ref = "7b63a27edef055a1c35d97d97651e78d41ea8a2f" },
        },
        latest = "0.0.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
