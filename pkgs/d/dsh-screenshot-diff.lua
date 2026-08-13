package = {
    spec = "1",

    name = "dsh-screenshot-diff",
    description = "DSH plugin: pixel-diff two screenshots into diff.png + triptych (pixelmatch) — 像素对比工具",
    repo = "https://github.com/PangYiMing/dsh-screenshot-diff",
    homepage = "https://github.com/PangYiMing/dsh-screenshot-diff",
    licenses = {"MIT"},
    authors = {"PangYiMing"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-screenshot-diff",
        source = "github",
        origin = "PangYiMing/dsh-screenshot-diff",

        versions = {
            ["0.1.0"] = { ref = "28600f8b88dcf71f60674977cc99553227f8eb00" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
