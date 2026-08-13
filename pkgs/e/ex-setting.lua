package = {
    spec = "1",

    name = "ex-setting",
    description = "DSH的设置扩展",
    repo = "https://github.com/omdsh-dev/ex-setting",
    homepage = "https://github.com/omdsh-dev/ex-setting",
    licenses = {"BSD-3-Clause"},
    authors = {"omdsh-dev"},

    status = "dev",
    categories = {"dsh-plugin"},
    keywords = {"dsh", "plugin"},

    dsh = {
        bundle_name = "@deepseek-ai/dsh-ex-setting",
        source = "github",
        origin = "omdsh-dev/ex-setting",

        versions = {
            ["0.0.2"] = { ref = "267d0f12cd1a49f2d0dfb3650ec0b9a0840d6a97" },
        },
        latest = "0.0.2",

        needs_build = true,
        license = "BSD-3-Clause",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
