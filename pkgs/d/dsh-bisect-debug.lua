package = {
    spec = "1",

    name = "dsh-bisect-debug",
    description = "DSH plugin: bisect bugs (code / boundary / commit) — 二分法定位 bug 根因",
    repo = "https://github.com/PangYiMing/dsh-bisect-debug",
    homepage = "https://github.com/PangYiMing/dsh-bisect-debug",
    licenses = {"MIT"},
    authors = {"PangYiMing"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "dsh-bisect-debug",
        source = "github",
        origin = "PangYiMing/dsh-bisect-debug",

        versions = {
            ["0.1.0"] = { ref = "312c66ebba4b3f16fe85f8f24d0e72ea7a78dfcf" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
