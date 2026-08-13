package = {
    spec = "1",

    name = "dsh-101",
    description = "DSH 文档阅读模式",
    repo = "https://github.com/bill9109/dsh-101",
    homepage = "https://github.com/bill9109/dsh-101",
    licenses = {"BSD-3-Clause"},
    authors = {"bill9109"},

    status = "dev",
    categories = {"dsh-plugin", "session"},
    keywords = {"dsh", "101"},

    dsh = {
        bundle_name = "@dsh-external/dsh-101",
        source = "github",
        origin = "bill9109/dsh-101",

        versions = {
            ["0.1.0"] = { ref = "1876b9aadc759a8e0a4d76c62a2207233d08bb29" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
