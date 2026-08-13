package = {
    spec = "1",

    name = "session-teleport",
    description = "dsh plugin from omdsh-dev/session-teleport",
    repo = "https://github.com/omdsh-dev/session-teleport",
    homepage = "https://github.com/omdsh-dev/session-teleport",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "session"},
    keywords = {"dsh", "data-migration", "postgresql", "session-management", "typescript"},

    dsh = {
        bundle_name = "@mattheliu/session-teleport",
        source = "github",
        origin = "omdsh-dev/session-teleport",

        versions = {
            ["0.6.0-rc.1"] = { ref = "d76e0d98b09ad1d08f2592ffd47161acb907bfc4" },
        },
        latest = "0.6.0-rc.1",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
