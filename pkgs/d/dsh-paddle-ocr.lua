package = {
    spec = "1",

    name = "dsh-paddle-ocr",
    description = "dsh plugin from omdsh-dev/dsh-paddle-ocr",
    repo = "https://github.com/omdsh-dev/dsh-paddle-ocr",
    homepage = "https://github.com/omdsh-dev/dsh-paddle-ocr",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin", "vision"},
    keywords = {"dsh", "paddle", "ocr"},

    dsh = {
        bundle_name = "dsh-paddle-ocr",

        versions = {
            ["0.1.0"] = { commit = "6e4e1282f9b545ddbfedead45ccdf4f5d227c53c" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
