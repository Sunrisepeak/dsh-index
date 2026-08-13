package = {
    spec = "1",

    name = "dsh-bisect-debug",
    description = "DSH plugin: bisect bugs (code / boundary / commit) — 二分法定位 bug 根因",
    repo = "https://github.com/PangYiMing/dsh-bisect-debug",
    homepage = "https://github.com/PangYiMing/dsh-bisect-debug",
    licenses = {"MIT"},
    authors = {"PangYiMing"},

    status = "dev",
    categories = {"dsh-plugin", "session"},
    keywords = {"dsh", "debugging", "git-bisect", "troubleshooting"},

    dsh = {
        bundle_name = "dsh-bisect-debug",

        versions = {
            ["0.1.0"] = { commit = "312c66ebba4b3f16fe85f8f24d0e72ea7a78dfcf" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
