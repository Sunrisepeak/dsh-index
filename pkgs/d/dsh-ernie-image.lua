package = {
    spec = "1",

    name = "dsh-ernie-image",
    description = "dsh plugin from omdsh-dev/dsh-ernie-image",
    repo = "https://github.com/omdsh-dev/dsh-ernie-image",
    homepage = "https://github.com/omdsh-dev/dsh-ernie-image",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "vision"},
    keywords = {"dsh", "ernie", "image"},

    dsh = {
        bundle_name = "dsh-ernie-image",

        versions = {
            ["0.1.0"] = { commit = "2c8292bc23a587f479604e7f0707e8cb25f43f01" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
