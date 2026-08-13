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

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.2.0"] = {
                tarball = "dsh-stock-market-0.2.0.tgz",
                sha256  = "ef38c2ff3cd0b62b710cd8f5838095f0b7983b1b7ea53c7983fe5307d81f4eb6",
                cn      = true,
            },
        },
    },
}
