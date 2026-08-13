package = {
    spec = "1",

    name = "dsh-stock-market",
    description = "有效解决了写代码的时候账户不能同时亏钱的BUG",
    repo = "https://github.com/AnacondaKC/dsh-stock-market",
    homepage = "https://github.com/AnacondaKC/dsh-stock-market",
    licenses = {"BSD-3-Clause"},
    authors = {"AnacondaKC"},

    status = "dev",
    categories = {"dsh-plugin", "fun"},
    keywords = {"dsh", "stock", "market"},

    dsh = {
        bundle_name = "dsh-stock-market",

        versions = {
            ["0.2.0"] = { commit = "02278af12330102c534c843a668d1c8407dbde1b" },
        },
        latest = "0.2.0",

        needs_build = false,

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
