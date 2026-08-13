package = {
    spec = "1",

    name = "dsh-custom-css",
    description = "dsh plugin from AnacondaKC/dsh-custom-css",
    repo = "https://github.com/AnacondaKC/dsh-custom-css",
    homepage = "https://github.com/AnacondaKC/dsh-custom-css",
    licenses = {"BSD-3-Clause"},
    authors = {"AnacondaKC"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "custom", "css"},

    dsh = {
        bundle_name = "dsh-custom-css",
        source = "github",
        origin = "AnacondaKC/dsh-custom-css",

        versions = {
            ["0.2.0"] = { ref = "d1e2ee86b223775947eb5e26c62291a45df2fdcd" },
        },
        latest = "0.2.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
