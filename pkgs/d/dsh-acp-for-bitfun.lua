package = {
    spec = "1",

    name = "dsh-acp-for-bitfun",
    description = "BitFun 与 DSH ACP 交互对接 插件",
    repo = "https://github.com/bobleer/dsh-acp-for-bitfun",
    homepage = "https://github.com/bobleer/dsh-acp-for-bitfun",
    licenses = {"MIT"},
    authors = {"bobleer"},

    status = "dev",
    categories = {"dsh-plugin", "provider"},
    keywords = {"dsh", "bitfun"},

    dsh = {
        bundle_name = "dsh-acp-for-bitfun",

        versions = {
            ["0.1.0"] = { commit = "8dedce1ee1a463cfb21e2ac0d8518a8d3c67c5aa" },
        },
        latest = "0.1.0",

        needs_build = false,

        -- Published by tools/mirror.py to GitHub and GitCode, verified
        -- three ways: local build, GLOBAL and CN all hash the same.
        mirror = {
            ["0.1.0"] = {
                tarball = "dsh-acp-for-bitfun-0.1.0.tgz",
                sha256  = "1e6c58a32e9633bb4f9d64f82cbc83ffc1854cde0d0a9ea2e6d2ca3f792317bb",
                cn      = true,
            },
        },
    },
}
