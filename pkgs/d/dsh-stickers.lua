package = {
    spec = "1",

    name = "dsh-stickers",
    description = "DSH WebUI sticker plugin for bidirectional user and agent reactions",
    repo = "https://github.com/william-jin-cmu/dsh-stickers",
    homepage = "https://github.com/william-jin-cmu/dsh-stickers",
    licenses = {"BSD-3-Clause"},
    authors = {"william-jin-cmu"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@dsh-external/dsh-stickers",
        source = "github",
        origin = "william-jin-cmu/dsh-stickers",

        versions = {
            ["0.1.0"] = { ref = "1703f09915db1058b6031b31e52fd404560e0a78" },
        },
        latest = "0.1.0",

        needs_build = true,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
