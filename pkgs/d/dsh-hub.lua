package = {
    spec = "1",

    name = "dsh-hub",
    description = "dsh plugin from omdsh-dev/dsh-hub",
    repo = "https://github.com/omdsh-dev/dsh-hub",
    homepage = "https://github.com/omdsh-dev/dsh-hub",
    licenses = {"MIT"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "nodejs", "plugin-manager", "plugin-marketplace", "registry"},

    dsh = {
        bundle_name = "@omdsh/dsh-hub",
        source = "github",
        origin = "omdsh-dev/dsh-hub",

        versions = {
            ["0.1.0-rc.1"] = { ref = "82c958c945542064cbdf3eeb2bb408f95187bfc0" },
        },
        latest = "0.1.0-rc.1",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
