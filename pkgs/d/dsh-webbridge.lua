package = {
    spec = "1",

    name = "dsh-webbridge",
    description = "DSH 结合 Kimi WebBridge",
    repo = "https://github.com/bill9109/dsh-webbridge",
    homepage = "https://github.com/bill9109/dsh-webbridge",
    licenses = {"BSD-3-Clause"},
    authors = {"bill9109"},

    status = "dev",
    categories = {"dsh-plugin", "web-ui"},
    keywords = {"dsh", "webbridge"},

    dsh = {
        bundle_name = "@dsh-external/dsh-webbridge",

        versions = {
            ["0.0.1"] = { commit = "a7f85bef095c42b61a4823b9002a6e22f5713754" },
        },
        latest = "0.0.1",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
