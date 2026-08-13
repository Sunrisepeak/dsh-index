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
        source = "github",
        origin = "bobleer/dsh-acp-for-bitfun",

        versions = {
            ["0.1.0"] = { ref = "8dedce1ee1a463cfb21e2ac0d8518a8d3c67c5aa" },
        },
        latest = "0.1.0",

        needs_build = false,
        license = "MIT",

        -- Mirror-eligible. The `mirror` block is filled in by the
        -- mirror pipeline once a tarball is published to xlings-res.
    },
}
