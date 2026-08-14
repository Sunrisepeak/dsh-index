package = {
    spec = "1",

    name = "dsh-qrcode",
    description = "DSH plugin: offline QR code (SVG/PNG/ASCII) and barcode (Code128/EAN-13) generator, no network, no shell.",
    repo = "https://github.com/hellosky983/dsh-qrcode",
    homepage = "https://github.com/hellosky983/dsh-qrcode",
    licenses = {"MIT"},
    authors = {"hellosky983"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh"},

    dsh = {
        kind = "plugin",
        -- Where this plugin's own README tells readers to install it.
        profile = "web",

        bundle_name = "dsh-qrcode",

        versions = {
            ["0.2.0"] = { commit = "42999c42fcdbc5b11e7acb7442a538f3105de42f" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- No `mirror` block yet: mirroring is redistribution, so
        -- tools/mirror.py adds one only after it has published a
        -- verified tarball under a licence that permits it.
    },
}
