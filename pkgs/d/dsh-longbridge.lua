package = {
    spec = "1",

    name = "dsh-longbridge",
    description = "dsh plugin from omdsh-dev/dsh-longbridge",
    repo = "https://github.com/omdsh-dev/dsh-longbridge",
    homepage = "https://github.com/omdsh-dev/dsh-longbridge",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "uncategorized"},
    keywords = {"dsh", "longbridge"},

    dsh = {
        bundle_name = "dsh-longbridge",
        source = "github",
        origin = "omdsh-dev/dsh-longbridge",

        versions = {
            ["0.1.0"] = { ref = "9a5a6909f202956068fcf04b4837409874d9c0d9" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
